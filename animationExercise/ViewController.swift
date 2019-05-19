//
//  ViewController.swift
//  animationExercise
//
//  Created by Daniel Aditya Istyana on 17/05/19.
//  Copyright © 2019 Daniel Aditya Istyana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let myView = UIView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
    
    var randomX = { return CGFloat.random(in: 50...300) }
    var randomY = { return CGFloat.random(in: 50...300) }
    
    var colorArray: [UIColor] = [
        // Isi dengan RGB warna yang mau dibuat
        // https://coolors.co/ed6a5a-f4f1bb-9bc1bc-5ca4a9-e6ebe0
        UIColor.generateFromRgb(red: 237, green: 106, blue: 90),
        UIColor.generateFromRgb(red: 244, green: 241, blue: 187),
        UIColor.generateFromRgb(red: 155, green: 193, blue: 188),
        UIColor.generateFromRgb(red: 92, green: 164, blue: 169),
        UIColor.generateFromRgb(red: 230, green: 235, blue: 240),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myView)
        myView.layer.cornerRadius = myView.bounds.height / 2
        
        // Set myView backgroundcolor to function pi    ckColorFromArray() result
        myView.backgroundColor = self.pickColorFromArray()
        
       
        let gesture = UITapGestureRecognizer(target: self, action: #selector(startAnimate))
        gesture.numberOfTapsRequired = 1
        
        myView.isUserInteractionEnabled = true
        myView.addGestureRecognizer(gesture)
    }
    
    @objc func startAnimate() {
        UIView.animate(withDuration: 0.2) {
            self.myView.backgroundColor = self.pickColorFromArray()
        }
    }
    
    func pickColorFromArray() -> UIColor {
        
        // Hitung jumlah warna di array colorArray
        let colorArrayCount = colorArray.count
        
        // Set myView backgroundcolor to randomColor
        let randomElement = Int.random(in: 0..<colorArrayCount)
        return colorArray[randomElement]
    }

}


extension UIColor {
    static func generateFromRgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
