//
//  TaskViewController.swift
//  ToDoList
//
//  Created by Keith Martin on 5/23/16.
//  Copyright © 2016 Keith Martin. All rights reserved.
//

import UIKit

protocol PassTaskItemBackDelegate: class {
    func passTaskItemBack(_ taskItem: TaskItem)
}

class TaskItemViewController: UIViewController {

    weak var delegate: PassTaskItemBackDelegate?
    
    @IBOutlet weak var taskItemTextField: UITextField!
    
    @IBAction func addTaskItemAndReturn(_ sender: AnyObject) {
        if let text = taskItemTextField.text {
            if !text.isEmpty {
                delegate?.passTaskItemBack(TaskItem(uuid: UUID().uuidString, task: taskItemTextField.text!))
                self.navigationController?.popViewController(animated: true)
            } else {
                showAlert("Cannot sumbit blank task")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationItem.hidesBackButton = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Dialogue showing error
    func showAlert(_ error: String) {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion:nil)
    }
}
