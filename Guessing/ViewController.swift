//
//  ViewController.swift
//  Guessing
//
//  Created by Andy Woodard on 6/14/16.
//  Copyright © 2016 WoodardStudios. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    
    	
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
   
    @IBOutlet weak var label1: UILabel!
    
    var fruits = [String]()
    var correctAnswer = 0
    var score = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
       
        fruits.append("strawberry")
        fruits.append("pineapple")
        fruits.append("cheese")
        fruits.append("chocolate")
        fruits.append("pancakes")
        fruits.append("grape")
        fruits.append("orange")
        fruits.append("peanut")
        
        
        askQuestion(nil)
        
    }
    
    func askQuestion(action: UIAlertAction! = nil){
    
        fruits = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(fruits) as! [String]
        
        button1.setImage(UIImage(named: fruits[0]), forState: .Normal)
        button2.setImage(UIImage(named: fruits[1]), forState: .Normal)
        button3.setImage(UIImage(named: fruits[2]), forState: .Normal)
        
        correctAnswer = GKRandomSource.sharedRandom().nextIntWithUpperBound(3)
        
        
        title = "CAN YOU FIND THE \(fruits[correctAnswer].uppercaseString)?"
        
        label1.text = String(score)

        
    }
    
    
    
    @IBAction func buttonPressed(sender: UIButton) {

        
        if sender.tag == correctAnswer{
            title = "Correct"
            score += 1
            askQuestion()
        }
        else {
            title = "Wrong"
        
            let ac = UIAlertController(title: "GAME OVER", message: "You got \(score) answers correct", preferredStyle: .Alert)
            ac.addAction(UIAlertAction(title: "RESET", style: .Default, handler: askQuestion))
            presentViewController(ac, animated: true, completion: nil)
            
            score = 0
        }
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

