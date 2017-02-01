//
//  ViewController.swift
//  Turkey Timer
//
//  Created by Arnold Aung on 2017-01-13.
//  Copyright © 2017 Arnold Myint. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var field_weight: UITextField!
    
    @IBOutlet weak var label_weightType: UILabel!
    
    @IBOutlet weak var switch_weightType: UISwitch!
    
    @IBOutlet weak var label_cookingTime: UILabel!
    
    @IBOutlet weak var label_alamofire: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        Alamofire.request("http://codewithchris.com/code/afsample.json").responseJSON { response in
            
            if let JSON = response.result.value {
                print(JSON as! String)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateCookingTime(_ sender: Any) {
        // get weight 
        // get type
        // convert to lbs
        // weight in lbs * 20 mintes
        //display result into label_cookingTime
        
        let theWeight = field_weight.text
        
        guard theWeight != "" else
        {
            label_cookingTime.text =  "Please type in a number in the weight field."
            return
        }
        let lbs : Float
        
        // on == lbs, off == kg
        if switch_weightType.isOn {
            lbs = Float(theWeight!)!
        } else {
            let kg  = Float(theWeight!)!
            lbs = Convert.kgToLbs(kg)
        }
        
        //weight in lbs * 20 minutes
        //let time = lbs * 20
        
        //display result in the label 
        //label_cookingTime.text =  "\(time)"
        
        
        let totalTime = lbs * 20
        let hours = Int(totalTime) / 60
        let minutes = Int (totalTime) % 60
        
        let cookingTime = String (format: "%02i hours and %02i mins", hours, minutes)
  
        label_cookingTime.text = "Turkey will be ready in \(cookingTime)"
        
        
    }
    
    @IBAction func changeWeightType(_ sender: Any) {
        let text : String
        
        if switch_weightType.isOn {
            text = "lbs"
        } else {
            text = "kg"
        }
        
        label_weightType.text = text;
    }
    
}
