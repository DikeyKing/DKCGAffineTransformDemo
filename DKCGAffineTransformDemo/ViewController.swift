//
//  ViewController.swift
//  DKCGAffineTransformDemo
//
//  Created by Dikey on 2019/3/6.
//  Copyright © 2019 Dikey. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var atSegment: UISegmentedControl!
    @IBOutlet weak var valueUnitSegment: UISegmentedControl!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var currentValue: UILabel!
    
    var affineTransform:CGAffineTransform!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.clipsToBounds = true
        self.imageView.backgroundColor = UIColor.white
        self.affineTransform = __CGAffineTransformMake(1, 0, 0, 1, 0, 0)
    }

    @IBAction func didChangedAffineTransformIndex(_ sender: UISegmentedControl) {
    }
    
    @IBAction func didChangedValueUnitSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.slider.minimumValue = -1
            self.slider.maximumValue = 1
            break
        case 1:
            self.slider.minimumValue = -10
            self.slider.maximumValue = 10
            break
        case 2:
            self.slider.minimumValue = -100
            self.slider.maximumValue = 100
            break
        case 3:
            self.slider.minimumValue = -1000
            self.slider.maximumValue = 1000
            break
        default:
            break
        }
    }
    
    @IBAction func didChangedSliderValue(_ sender: UISlider) {
        switch self.atSegment.selectedSegmentIndex {
        case 0:
            self.affineTransform.a = CGFloat(sender.value)
            break
        case 1:
            self.affineTransform.b = CGFloat(sender.value)
            break

        case 2:
            self.affineTransform.c = CGFloat(sender.value)
            break

        case 3:
            self.affineTransform.d = CGFloat(sender.value)
            break

        case 4:
            self.affineTransform.tx = CGFloat(sender.value)
            break

        case 5:
            self.affineTransform.ty = CGFloat(sender.value)
            break

        default:
        break
        }
        self.imageView.transform = self.affineTransform
        let format = ".2"
        self.currentValue.text = "a:\(self.affineTransform.a.format(f: format)) b:\(self.affineTransform.b.format(f:format)) c:\(self.affineTransform.c.format(f: format)) d:\(self.affineTransform.d.format(f: format)) tx:\(self.affineTransform.tx.format(f: format)) ty:\(self.affineTransform.ty.format(f: format))"
        print("Rect is \(self.imageView.frame)")
    }
    
}

extension CGFloat {
    func format(f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}
