//
//  OutSideViewController.swift
//  SAIOT
//
//  Created by 양창엽 on 2018. 3. 29..
//  Copyright © 2018년 Yang-Chang-Yeop. All rights reserved.
//

import UIKit
import AudioToolbox

class OutSideViewController: UIViewController {
    
    // MARK: - Variable
    private let shapeLayer: CAShapeLayer = CAShapeLayer()
    
    // MARK: - Outlet Variable
    @IBOutlet weak var outsideCircle: UIView! {
        didSet {
            outsideCircle.layer.cornerRadius = outsideCircle.frame.size.width / 2
            outsideCircle.clipsToBounds = true
        }
    }
    @IBOutlet weak var innerCircle: UIView! {
        didSet {
            innerCircle.layer.cornerRadius = innerCircle.frame.size.width / 2
            innerCircle.clipsToBounds = true
        }
    }
    @IBOutlet weak var stateCircle: UIButton! {
        didSet {
            shapeLayer.path = UIBezierPath(arcCenter: stateCircle.center, radius: outsideCircle.layer.cornerRadius, startAngle: -CGFloat.pi / 2, endAngle: CGFloat.pi * 2, clockwise: true).cgPath
            shapeLayer.strokeColor = UIColor.lightcoral.cgColor
            shapeLayer.lineWidth = 10
            shapeLayer.lineCap = kCALineCapRound
            shapeLayer.fillColor = UIColor.clear.cgColor
            shapeLayer.strokeEnd = 0
            outsideCircle.layer.addSublayer(shapeLayer)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    // MARK: - IBAction Method
    @IBAction func showState(_ sender: UIButton) {
        
        AudioServicesPlayAlertSound(4095)
        
        // Inner Circle Animation
        UIView.animate(withDuration: 2, animations: { [weak mySelf = self] in
            
            // Outside Circle Animation
            let basicAnimation: CABasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
            basicAnimation.toValue = 1
            basicAnimation.duration = 2
            basicAnimation.fillMode = kCAFillModeForwards
            basicAnimation.isRemovedOnCompletion = false
            mySelf?.shapeLayer.add(basicAnimation, forKey: "Basic")
            
            sender.backgroundColor = sender.backgroundColor == UIColor.springgreen ? UIColor.blanchedalmond : UIColor.springgreen
        }, completion: { animated in
            
            if animated {
            }
        })
        
        
    }
}
