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
        view.backgroundColor = UIColor(red: 0/255.0, green: 104/255.0, blue: 249/255.0, alpha: 1.0)
        self.cloud.alpha = 0.0
        self.lightning.alpha = 0.0
        animateBackground()
        animateSunAndCloud()
        animateCloud()
        animateMoon()
        animateLightning()
        
    }
    
    func setup() {
        view.addSubview(sun)
        view.addSubview(moon)
        view.addSubview(cloud)
        view.addSubview(lightning)
    }
    
    func animateBackground() {
        
        let animation = CAKeyframeAnimation(keyPath: "backgroundColor")
        animation.values = [ UIColor(red: 0/255.0, green: 104/255.0, blue: 249/255.0, alpha: 1.0).cgColor,
                             UIColor(red: 94/255.0, green: 206/255.0, blue: 249/255.0, alpha: 1.0).cgColor,
                             UIColor(red: 249/255.0, green: 179/255.0, blue: 0/255.0, alpha: 1.0).cgColor,
                             UIColor(red: 48/255.0, green: 62/255.0, blue: 103/255.0, alpha: 1.0).cgColor
        ]
        animation.keyTimes = [0.0, 0.85, 0.93, 1.0]
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        animation.calculationMode = kCAAnimationCubic
        animation.fillMode = kCAFillModeForwards
        animation.duration = 20
        self.view.layer.add(animation, forKey: "backgroundColor")
        
        
    }
    
    func animateSunAndCloud() {
        
        self.sun.frame = CGRect(x: self.view.frame.minX - 200, y: self.view.center.y - 200, width: self.view.frame.width * 0.33, height: self.view.frame.width * 0.33)
        self.view.addSubview(self.sun)
        
        let endPoint = CGPoint(x: self.view.frame.minX - 100, y: self.view.frame.maxY - 200)
        let controlPoint1 = CGPoint(x: self.view.frame.width, y: 0.0)
        let controlPoint2 = CGPoint(x: self.view.frame.minX, y: 0.0)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.view.frame.maxX, y: self.view.frame.maxY))
        path.addCurve(to: endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        
        let animateSun = CAKeyframeAnimation(keyPath: "position")
        animateSun.path = path.cgPath
        animateSun.fillMode = kCAAnimationCubicPaced
        animateSun.isRemovedOnCompletion = true
        animateSun.repeatCount = 0
        animateSun.duration = 20
        self.sun.layer.add(animateSun, forKey: "sun rising")
        
        
    }
    
    func animateMoon() {
        
        self.view.addSubview(moon)
        self.moon.frame = CGRect(x: self.view.frame.width * 0.25, y: self.view.frame.width * 0.25, width: self.view.frame.width * 0.33, height: self.view.frame.width * 0.33)
        
        let moonEndpoint = CGPoint(x: self.view.frame.width * 0.25, y: self.view.frame.height * 0.25)
        let controlPoint2 = CGPoint(x: self.view.frame.minX, y: 0.0)
        
        let path2 = UIBezierPath()
        path2.move(to: CGPoint(x: self.view.frame.minX - 200, y: self.view.center.y - 200))
        path2.addQuadCurve(to: moonEndpoint, controlPoint: controlPoint2)
        
        let animateMoon = CAKeyframeAnimation(keyPath: "position")
        animateMoon.path = path2.cgPath
        animateMoon.fillMode = kCAFillModeForwards
        animateMoon.isRemovedOnCompletion = false
        animateMoon.autoreverses = true
        animateMoon.duration = 30
        
        self.moon.layer.add(animateMoon, forKey: "animate moon")
        
    }
    
    func animateCloud() {
        
        self.view.addSubview(cloud)
        self.cloud.frame = CGRect(x: self.view.frame.width * 0.25, y: self.view.center.y, width: self.view.frame.width * 0.50, height: self.view.frame.height * 0.10)
        UIView.animate(withDuration: 10, delay: 0.0, options: [.repeat, .autoreverse], animations: {
            
            self.cloud.center.y = self.view.frame.height * 0.40
            self.cloud.alpha = 1.0
            
            }, completion: nil)
        
    }
    
    func animateLightning() {
        
        self.view.addSubview(lightning)
        lightning.frame = CGRect(x: self.view.frame.width * 0.25, y: self.view.center.y + cloud.frame.height, width: self.view.frame.width * 0.33, height: self.view.frame.height * 0.25)
        lightning.center.x = cloud.center.x
        
        UIView.animate(withDuration: 10, delay: 0.0, options: [.autoreverse], animations: {
            
            self.lightning.center.y = self.view.frame.height * 0.40 + (self.cloud.frame.height/2)
            self.lightning.alpha = 1.0
            
            }, completion: nil)
        
    }
    
}
