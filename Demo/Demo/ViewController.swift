//
//  ViewController.swift
//  Demo
//
//  Created by Yuto Akiba on 2018/10/05.
//  Copyright © 2018 Yuto Akiba. All rights reserved.
//

import UIKit
import BlurKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.bk.addBlur(blurRadius: 5)
        
        view.bk.addBlur()
        
        view.bk.addBlur()
        
        let blueView = UIView(frame: CGRect(x: 30, y: 30, width: 100, height: 100))
        blueView.backgroundColor = .blue
        view.addSubview(blueView)

        //  or
        //  label.bk.addBlur(blurRadius: 3, colorTint: .white, colorTintAlpha: 0.4)
        //  imageView.bk.addBlur(blurRadius: 4, colorTint: .white, colorTintAlpha: 0.2)
    }
}

