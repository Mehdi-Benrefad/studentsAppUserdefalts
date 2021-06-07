//
//  editUserViewController.swift
//  tableViewUserDefaults
//
//  Created by Mehdi Benrefad on 07/06/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import UIKit

class editUserViewController: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource {

    
    var std:student?
    var index:Int?
    
    @IBOutlet weak var fn: UITextField!
    @IBOutlet weak var ln: UITextField!
    @IBOutlet weak var mk: UITextField!
    @IBOutlet weak var classe: UIPickerView!
    
    
    var first = [String]()
    var last = [String]()
    var classes = [String]()
    var mark = [Float]()
    
    var selectedClass = ""
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 4
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        for i in 0..<4
        {
            if row == i {
                return String(i + 1)
            }
        }
        return String(1)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedClass = String(row + 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fn.text = std?.firstname
        ln.text = std?.lastname
        mk.text = String(std!.Mark)
        

    }
    
    @IBAction func edit(_ sender: Any) {
        if  ( UserDefaults.standard.object(forKey: "first") != nil ){
                
              self.mark = UserDefaults.standard.object(forKey: "mark") as! [Float]
              
              self.classes = UserDefaults.standard.object(forKey: "classe") as! [String]
              
              self.first = UserDefaults.standard.object(forKey: "first") as! [String]
              
              self.last = UserDefaults.standard.object(forKey: "last") as! [String]
              
            }

           
                
            self.first[index!] = fn.text!
            self.last[index!] = ln.text!
            self.mark[index!] = Float(mk.text!)!
            self.classes[index!] = selectedClass
        
            //defaults.set(first, forKey: "first")
            //defaults.set(last, forKey: "last")
            //defaults.set(classe, forKey: "classe")
            //defaults.set(mark,forKey: "mark")
            
        }
    }
    

