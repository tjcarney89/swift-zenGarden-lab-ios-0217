//
//  ViewController.swift
//  ZenGarden
//
//  Created by Flatiron School on 6/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var rakeImage: UIImageView!
    @IBOutlet weak var rockImage: UIImageView!
    @IBOutlet weak var shrubImage: UIImageView!
    @IBOutlet weak var swordImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        rakeImage.isUserInteractionEnabled = true
        rockImage.isUserInteractionEnabled = true
        shrubImage.isUserInteractionEnabled = true
        swordImage.isUserInteractionEnabled = true
        
        let rakePanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(myPanAction))
        let rockPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(myPanAction))
        let shrubPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(myPanAction))
        let swordPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(myPanAction))
        
        rakePanGestureRecognizer.minimumNumberOfTouches = 1
        rakePanGestureRecognizer.maximumNumberOfTouches = 1
        
        rockPanGestureRecognizer.minimumNumberOfTouches = 1
        rockPanGestureRecognizer.maximumNumberOfTouches = 1
        
        shrubPanGestureRecognizer.minimumNumberOfTouches = 1
        shrubPanGestureRecognizer.maximumNumberOfTouches = 1
        
        swordPanGestureRecognizer.minimumNumberOfTouches = 1
        swordPanGestureRecognizer.maximumNumberOfTouches = 1
        
        rakeImage.addGestureRecognizer(rakePanGestureRecognizer)
        rockImage.addGestureRecognizer(rockPanGestureRecognizer)
        shrubImage.addGestureRecognizer(shrubPanGestureRecognizer)
        swordImage.addGestureRecognizer(swordPanGestureRecognizer)
        
        

    }
    
    
    func myPanAction(recognizer: UIPanGestureRecognizer) {
        if ((recognizer.state != UIGestureRecognizerState.ended) && (recognizer.state != UIGestureRecognizerState.failed)) {
            recognizer.view?.center = recognizer.location(in: recognizer.view?.superview)
        }
        
        let myAlert = UIAlertController(title: "Congratulations", message: "You won!", preferredStyle: .alert)
        let myAction = UIAlertAction(title: "Reset", style: .default, handler: { action in self.resetImages() } )
        myAlert.addAction(myAction)
        
        print(recognizer.view!.frame)
        if ((swordImage.frame.origin.x <= 15) && (swordImage.frame.origin.y <= 105 && rockImage.frame.origin.y >= 300 || (swordImage.frame.origin.y >= 530 && rockImage.frame.origin.y <= 300))) && shrubImage.frame.intersects(rakeImage.frame) {
            self.present(myAlert, animated: true)
            print("WINNER!")
        }
    }
    
    func resetImages() {
        rockImage.frame.origin.x = CGFloat(arc4random_uniform(UInt32(173)))
        rockImage.frame.origin.y = CGFloat(arc4random_uniform(UInt32(602)))
        rakeImage.frame.origin.x = CGFloat(arc4random_uniform(UInt32(171)))
        rakeImage.frame.origin.y = CGFloat(arc4random_uniform(UInt32(603)))
        shrubImage.frame.origin.x = CGFloat(arc4random_uniform(UInt32(170)))
        shrubImage.frame.origin.y = CGFloat(arc4random_uniform(UInt32(605)))
        swordImage.frame.origin.x = CGFloat(arc4random_uniform(UInt32(171)))
        swordImage.frame.origin.y = CGFloat(arc4random_uniform(UInt32(601)))
    }
    
    
    
    
    

}

//((shrubImage.frame.origin.x...rakeImage.frame.origin.x + 10 ~= shrubImage.frame.origin.x) && (shrubImage.frame.origin.y...rakeImage.frame.origin.y + 10 ~= shrubImage.frame.origin.y))
