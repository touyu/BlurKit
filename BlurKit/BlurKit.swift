//
//  BlurKit.swift
//  BlurKit
//
//  Created by Yuto Akiba on 2018/10/05.
//  Copyright © 2018 Yuto Akiba. All rights reserved.
//

import UIKit

class dummyObj {
    init() {
        swizzMothod()
    }
    
    private func swizzMothod() {
        let m1 = class_getInstanceMethod(UIView.self, #selector(UIView().addSubview(_:)))!
        let m2 = class_getInstanceMethod(UIView.self, #selector(UIView()._addSubview(_:)))!
        method_exchangeImplementations(m1, m2)
    }
}

private var isShouldSwizzMethodKey: UInt8 = 0

public protocol BlurKitCompatible {
    associatedtype Compatible

    var bk: Compatible { get }
}

public final class BlurKit<Base> {
    let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

public extension BlurKitCompatible {
    public var bk: BlurKit<Self> {
        return BlurKit(self)
    }
}

extension UIView: BlurKitCompatible {
    @objc fileprivate func _addSubview(_ view: UIView) {
        _addSubview(view)
        if let blurView = bk.blurView {
            bk.base.bringSubviewToFront(blurView)
        }
    }
}

extension BlurKit where Base: UIView {
    public var blurRadius: CGFloat {
        get { return blurView?.blurRadius ?? 0 }
        set { blurView?.blurRadius = newValue }
    }

    public var colorTint: UIColor {
        get { return blurView?.colorTint ?? .white }
        set { blurView?.colorTint = newValue }
    }

    public var colorTintAlpha: CGFloat {
        get { return blurView?.colorTintAlpha ?? 0 }
        set { blurView?.colorTintAlpha = newValue }
    }
    
    public var isBlurHidden: Bool {
        get { return blurView?.isHidden ?? false }
        set { blurView?.isHidden = newValue }
    }

    public func addBlur(blurRadius: CGFloat = 10, colorTint: UIColor? = nil, colorTintAlpha: CGFloat = 0.0) {
        print(isShouldSwizzMethod)
        if isShouldSwizzMethod {
            swizzMothod()
            isShouldSwizzMethod = false
        }
        print(isShouldSwizzMethod)
        if !canAddBlur { return }

        let blurView = BlurView(frame: base.frame)
        blurView.restorationIdentifier = blurViewID
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.blurRadius = blurRadius
        blurView.colorTint = colorTint
        blurView.colorTintAlpha = colorTintAlpha
        base.addSubview(blurView)
        addConstrains(view: blurView)
    }

    public func removeBlur() {
        blurView?.removeFromSuperview()
    }

    fileprivate var blurView: BlurView? {
        return base.subviews.first(where: { $0.restorationIdentifier == blurViewID }) as? BlurView
    }

    private var canAddBlur: Bool {
        return blurView == nil
    }

    private var blurViewID: String {
        return "_blur_view" + ObjectIdentifier(base).debugDescription
    }

    private func addConstrains(view: UIView) {
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: base.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: base.trailingAnchor),
            view.topAnchor.constraint(equalTo: base.topAnchor),
            view.bottomAnchor.constraint(equalTo: base.bottomAnchor),
        ])
    }
    
    private func swizzMothod() {
        let m1 = class_getInstanceMethod(Base.self, #selector(base.addSubview(_:)))!
        let m2 = class_getInstanceMethod(Base.self, #selector(base._addSubview(_:)))!
        print(method_getImplementation(m1))
        print(method_getImplementation(m2))
        method_exchangeImplementations(m1, m2)
    }
    
    var isShouldSwizzMethod: Bool {
        get { return objc_getAssociatedObject(self, &isShouldSwizzMethodKey) as? Bool ?? true }
        set { objc_setAssociatedObject(self, &isShouldSwizzMethodKey, newValue, .OBJC_ASSOCIATION_RETAIN) }
    }
}
