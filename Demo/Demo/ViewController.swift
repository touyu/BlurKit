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

        label.bk.addBlur(blurRadius: 3, colorTint: .white, colorTintAlpha: 0.4)
        imageView.bk.addBlur(blurRadius: 4, colorTint: .white, colorTintAlpha: 0.2)
    }
}

