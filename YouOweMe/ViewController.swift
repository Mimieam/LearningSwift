//
//  ViewController.swift
//  YouOweMe
//
//  Created by Aman Miezan Echimane on 10/19/14.
//  Copyright (c) 2014 Monster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var counter = 1
    @IBOutlet weak var HWtextfield: UITextField!
    
    @IBOutlet weak var pictureBG: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    @IBAction func helloworld_button(sender: AnyObject) {
        print("hello world again !!")
        HWtextfield.text = "Yo man "
        textLabel.text = ""+String(counter)
        counter++
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello world")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

