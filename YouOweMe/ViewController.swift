//
//  ViewController.swift
//  YouOweMe
//
//  Created by Aman Miezan Echimane on 10/19/14.
//  Copyright (c) 2014 Monster. All rights reserved.
//

import UIKit

class Debt {
    var amount: Double
    var description: String
    var createdOn: NSDate
    var isPaidOff: Bool
    var paidOn:NSDate?
    
    init (amount:Double , description: String){
        self.amount = amount
        self.description = description
        self.createdOn = NSDate()
        self.isPaidOff = false
        self.paidOn = nil
    }
}

// you owe me
class Person {
    var name: String = ""
    var accountNumber: Double = 0.0
    var debtors:[String:Dictionary<String, Double>]
    
    init(name:String, accountNumber:Double){
        self.name = name
        self.accountNumber = accountNumber
        self.debtors =  Dictionary<String, Dictionary<String,Double>>()
    }
    
    func addNewDebt(name:String, description:String, amount:Double){
        if (debtors[name] != nil) {
            self.debtors[name]?.updateValue(amount, forKey: description)
        }
        else {
            self.debtors[name] = [description:amount]
        }
    }
    
    func getTabFor(name:String) -> [String:Double]{
        if debtors[name] != nil {
            return self.debtors[name]!
        }
        else {
            return ["": 0]
        }
    }
    
    func getTabTotal(name:String) -> Double{
        if debtors[name] != nil {
            var total = 0.0
            for (key,value)in debtors[name]! {
                print(key, value)
                total += value
            }
            return total
        }
        return 0.0
    }
}


class ViewController: UIViewController {

    var counter = 1
    @IBOutlet weak var HWtextfield: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pictureBG: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    var me = Person(name: "miezan", accountNumber: 3332.4)
  
    
    @IBAction func helloworld_button(sender: AnyObject) {
        print("hello world again !!")
        HWtextfield.text = "Yo man "
        textLabel.text = ""+String(counter)
        counter++
        
        me.addNewDebt("Mangny", description: "elecric bill october" ,amount: 32)
        me.addNewDebt("Cynthia", description: "Insurance bill october" ,amount: 4)
        me.addNewDebt("Cynthia", description: "Insurance bill November" ,amount: 5)
        
        
        for x in me.debtors.keys{
            print(x)
            print(me.debtors[x])
        }
        
        me.getTabFor("Many")
        me.getTabTotal("Cynthia")
        me.getTabTotal("Mangny")
        
        print(me.name)
        print(me.accountNumber)

        
        
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

