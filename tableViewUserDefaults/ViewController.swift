//
//  ViewController.swift
//  tableViewUserDefaults
//
//  Created by Mehdi Benrefad on 06/06/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource  {
    @IBOutlet weak var tableview: UITableView!
    
    var students=[student]()
    
     var first = [String]()
     var last = [String]()
     var classe = [String]()
     var mark = [Float]()
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        // Do any additional setup after loading the view.
        print(UserDefaults.standard.object(forKey: "first")as! [String])
        if UserDefaults.standard.object(forKey: "first") == nil {
            defaults.set(first, forKey: "first")

        }
        
        if UserDefaults.standard.object(forKey: "last") == nil {
            defaults.set(last, forKey: "last")

        }
        
        if UserDefaults.standard.object(forKey: "classe") == nil {
                  defaults.set(classe, forKey: "classe")

              }

        if UserDefaults.standard.object(forKey: "mark") == nil {
                  defaults.set(mark, forKey: "mark")

              }

        
        
        if  ( UserDefaults.standard.object(forKey: "mark") != nil ) {
            
            self.first = UserDefaults.standard.object(forKey: "first") as! [String]
                          
                          self.last = UserDefaults.standard.object(forKey: "last") as!
                              [String]
                          
                          self.classe = UserDefaults.standard.object(forKey: "classe") as! [String]
                          
                          self.mark = UserDefaults.standard.object(forKey: "mark") as! [Float]
                          
                          students = []
                          for i in 0..<first.count {
                              
                            students.append(student(firstname: self.first[i], lastname: self.last[i], studentclass: self.classe[i], Mark: self.mark[i]))
                              
                          }
            
        }
        
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        if UserDefaults.standard.object(forKey: "first") == nil {
            defaults.set(first, forKey: "first")

        }
        
        if UserDefaults.standard.object(forKey: "last") == nil {
            defaults.set(last, forKey: "last")

        }
        
        if UserDefaults.standard.object(forKey: "classe") == nil {
                  defaults.set(classe, forKey: "classe")

              }

        if UserDefaults.standard.object(forKey: "mark") == nil {
                  defaults.set(mark, forKey: "mark")

              }

        
        
        if  ( UserDefaults.standard.object(forKey: "mark") != nil ) {
            
            self.first = UserDefaults.standard.object(forKey: "first") as! [String]
                          
                          self.last = UserDefaults.standard.object(forKey: "last") as!
                              [String]
                          
                          self.classe = UserDefaults.standard.object(forKey: "classe") as! [String]
                          
                          self.mark = UserDefaults.standard.object(forKey: "mark") as! [Float]
                          
                          
                          for i in 0..<first.count {
                              
                              students.append(student(firstname: self.first[i], lastname: self.last[i], studentclass: self.classe[i], Mark: self.mark[i]))
                              
                          }
        }
    }
    
    @IBAction func swipe(_ sender: Any) {
        tableview.isEditing = !tableview.isEditing
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        first.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell") as! customCellTableViewCell
        let data = students[indexPath.row]
        cell.initialise(fn: data.firstname, ln: data.lastname, cl: data.studentclass, ma: data.Mark, image: UIImage(named: "mehdi")!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        students.swapAt(sourceIndexPath.row, destinationIndexPath.row)
                
        self.mark.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        
        self.classe.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        
        self.first.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        
        self.last.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        
        defaults.set(first, forKey: "first")
        defaults.set(last, forKey: "last")
        defaults.set(classe, forKey: "classe")
        defaults.set(mark, forKey: "mark")
        
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            print(indexPath.row)
            print(self.first)
            
            self.students.remove(at: indexPath.row)
            
            self.first.remove(at: indexPath.row)
            
            self.last.remove(at: indexPath.row)
            
            self.classe.remove(at: indexPath.row)
            
            self.mark.remove(at: indexPath.row)
            
            
            self.defaults.set(self.first, forKey: "first")
            self.defaults.set(self.last, forKey: "last")
            self.defaults.set(self.classe, forKey: "classe")
            self.defaults.set(self.mark,forKey: "mark")
            
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            
            completionHandler(true)
            
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    //edit
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "editcell"{
             let ec = segue.destination as! editUserViewController
             ec.index = tableview.indexPathForSelectedRow!.row
             ec.std = self.students[tableview.indexPathForSelectedRow!.row]
             
         }
     }
     
    
}
