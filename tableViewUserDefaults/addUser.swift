//
//  addUser.swift
//  tableViewUserDefaults
//
//  Created by Mehdi Benrefad on 07/06/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import UIKit

class addUser: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource{
    @IBOutlet weak var fnlabel: UITextField!
    @IBOutlet weak var lnlabel: UITextField!
    @IBOutlet weak var mlabel: UITextField!
    @IBOutlet weak var pickClass: UIPickerView!
    
    var first = [String]()
    var last = [String]()
    var classe = [String]()
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
    
    @IBAction func desmiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func add(_ sender: Any) {print("hello")
        if  ( UserDefaults.standard.object(forKey: "first") != nil ){
            self.mark = UserDefaults.standard.object(forKey: "mark") as!
                [Float]
            
            self.classe = UserDefaults.standard.object(forKey: "classe") as! [String]
            
            self.first = UserDefaults.standard.object(forKey: "first") as! [String]
            
            self.last = UserDefaults.standard.object(forKey: "last") as!
                [String]
                        
        }
        self.first.append(fnlabel.text!)
        self.last.append(lnlabel.text!)
        self.classe.append(selectedClass)
        self.mark.append(Float(mlabel.text!)!)
        
        defaults.set(first, forKey: "first")
        defaults.set(last, forKey: "last")
        defaults.set(classe, forKey: "classe")
        defaults.set(mark,forKey: "mark")
        
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "Menu") as! ViewController
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
        newViewController.first = self.first
        newViewController.last = self.last
        newViewController.mark = self.mark
        newViewController.classe = self.classe
        newViewController.tableview.reloadData()
    }
    
    
    @IBAction func recognizer(_ sender: Any) {
        fnlabel.resignFirstResponder()
        lnlabel.resignFirstResponder()
        mlabel.resignFirstResponder()
        
    }
}
