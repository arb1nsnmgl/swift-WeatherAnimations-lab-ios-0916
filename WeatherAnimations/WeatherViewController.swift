//
//  ViewController.swift
//  WeatherAnimations
//
//  Created by Ian Rahman on 10/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, CAAnimationDelegate {
    
    
    let sun = UIImageView(image: UIImage(named: "Sun"))
    let moon = UIImageView(image: UIImage(named: "Moon"))
    let cloud = UIImageView(image: UIImage(named: "Cloud"))
    let lightning = UIImageView(image: UIImage(named: "Lightning"))
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setup()
        animateBackground()
        animateSun()
        animateCloud()
        animateMoon()
        animateLightning()
        
    }
    
    func setup() {
        view.addSubview(sun)
        view.addSubview(moon)
        view.addSubview(cloud)
        view.addSubview(lightning)
        
        self.sun.frame = CGRect(x: self.view.frame.minX - 200, y: self.view.center.y - 200, width: self.view.frame.width * 0.33, height: self.view.frame.width * 0.33)
        self.moon.frame = CGRect(x: -self.view.center.x, y: self.view.center.y * 0.20, width: self.view.frame.width * 0.20, height: self.view.frame.width * 0.20)
        self.cloud.frame = CGRect(x: self.view.center.x, y: self.view.center.y, width: self.view.frame.width * 0.33, height: self.view.frame.width * 0.20)
        self.cloud.center = self.view.center
        self.lightning.frame = CGRect(x: self.cloud.frame.minX, y: self.cloud.frame.maxY + self.cloud.frame.width * 0.05, width: self.view.frame.width * 0.20, height: self.view.frame.width * 0.30)
        self.lightning.center = self.cloud.center
        
        
    }
    
    func animateBackground() {
        
        let animation = CAKeyframeAnimation(keyPath: "backgroundColor")
        animation.values = [ UIColor(red: 0/255.0, green: 104/255.0, blue: 249/255.0, alpha: 1.0).cgColor,
                             UIColor(red: 94/255.0, green: 206/255.0, blue: 249/255.0, alpha: 1.0).cgColor,
                             UIColor(red: 249/255.0, green: 179/255.0, blue: 0/255.0, alpha: 1.0).cgColor,
                             UIColor(red: 48/255.0, green: 62/255.0, blue: 103/255.0, alpha: 1.0).cgColor
        ]
        animation.keyTimes = [0.0, 0.5, 0.75, 1.0]
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        animation.duration = 20
        self.view.layer.add(animation, forKey: nil)
        
        
    }
    
    func animateSun() {
        
        let animateSun = CAKeyframeAnimation(keyPath: "position")
        animateSun.duration = 20.0
        animateSun.keyTimes = [0.0, 0.5, 1.0]
        animateSun.values = [ CGPoint(x: self.view.frame.maxX + 100, y: self.view.frame.maxY + 100),
                              CGPoint(x: self.view.frame.maxX * 0.5, y: self.view.frame.height * 0.20),
                              CGPoint(x: self.view.frame.minX - 100, y: self.view.frame.maxY - 100)
            ].map({NSValue(cgPoint: $0)})
        animateSun.repeatCount = HUGE
        animateSun.isRemovedOnCompletion = false
        sun.layer.add(animateSun, forKey: nil)
        
        
    }
    
    func animateMoon() {
        
        let animateMoon = CABasicAnimation(keyPath: "position")
        animateMoon.fromValue = NSValue(cgPoint: CGPoint(x: -self.view.center.x, y: self.view.center.y * 0.20))
        animateMoon.toValue = NSValue(cgPoint: CGPoint(x: self.view.center.x * 0.30, y: self.view.frame.height * 0.20))
        
        let fadeMoon = CABasicAnimation(keyPath: "opacity")
        fadeMoon.fromValue = 0.0
        fadeMoon.toValue = 1.0
        
        let animateGroup = CAAnimationGroup()
        animateGroup.duration = 5
        animateGroup.repeatCount = Float.infinity
        animateGroup.autoreverses = true
        animateGroup.isRemovedOnCompletion = false
        animateGroup.animations = [animateMoon,fadeMoon]
        animateGroup.beginTime = CACurrentMediaTime() + 15.5
        moon.layer.add(animateGroup, forKey: nil)
        
    }
    
    func animateCloud() {
        
        let animateCloud = CABasicAnimation(keyPath: "position")
        animateCloud.fromValue = NSValue(cgPoint: CGPoint(x: self.view.center.x, y: self.view.center.y))
        animateCloud.toValue = NSValue(cgPoint: CGPoint(x: self.view.center.x, y: self.view.frame.height * 0.2))
        
        let fadeCloud = CABasicAnimation(keyPath: "opacity")
        fadeCloud.fromValue = 0.0
        fadeCloud.toValue = 1.0
        
        let animateGroup = CAAnimationGroup()
        animateGroup.duration = 10
        animateGroup.repeatCount = Float.infinity
        animateGroup.autoreverses = true
        animateGroup.isRemovedOnCompletion = false
        animateGroup.animations = [fadeCloud,animateCloud]
        cloud.layer.add(animateGroup, forKey: nil)
        
    }
    
    func animateLightning() {
        
        let animateLightning = CABasicAnimation(keyPath: "position")
        animateLightning.fromValue = NSValue(cgPoint: CGPoint(x: self.view.center.x, y: self.view.frame.height * 0.65 ))
        animateLightning.toValue = NSValue(cgPoint: CGPoint(x: self.view.center.x, y: self.view.frame.height * 0.35))
        
        let fadeLightning = CABasicAnimation(keyPath: "opacity")
        fadeLightning.fromValue = 0.0
        fadeLightning.toValue = 1.0
        
        let animateGroup = CAAnimationGroup()
        animateGroup.duration = 10
        animateGroup.repeatCount = Float.infinity
        animateGroup.autoreverses = true
        animateGroup.isRemovedOnCompletion = false
        animateGroup.animations = [fadeLightning,animateLightning]
        lightning.layer.add(animateGroup, forKey: nil)

    }
    
}
