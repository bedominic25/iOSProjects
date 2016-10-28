//
//  TaskItemListViewController.swift
//  ToDoList
//
//  Created by 1800 on 10/12/16.
//  Copyright © 2016 1800. All rights reserved.
//

import UIKit
import PubNub

struct TaskItem {
    var uuid:String
    var task:String
    
}

class TaskItemListViewController: UIViewController, PNObjectEventListener,UITableViewDelegate, UITableViewDataSource, PassTaskItemBackDelegate{
    
    var mainChannelName: String = ""
    var deleteChannelName: String = ""
    var taskListItems: [TaskItem] = []
    var deleteTaskItems: [TaskItem] = []
    var allTasksItems: [TaskItem] = []
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))as UIActivityIndicatorView
    let serialQueue: dispatch_time_t = dispatch_queue_create("pageHistoryQueue",DISPATCH_QUEUE_SERIAL)
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    var fromAddTaskVC: Bool = false
    
    @IBOutlet weak var tableView:UITableView!

    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if !fromAddTaskVC {
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.title = mainChannelName + "ToDo list"
        showActivitivityIndicator()
        tablewView.dataSource = self
        tableView.delegate = self
        AppDelegate.client.addListener(self)r
    }
    }else {
        fromAddTaskVC = false
    }
}


//Spinning indicator when loading request
func showActivityIndicator() {
    activityIndicator.center = self.view.center
    activityIndicator.hidesWhenStopped = true
    activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
    view.addSubview(activityIndicator)
    activityIndicator.startAnimating()
}
