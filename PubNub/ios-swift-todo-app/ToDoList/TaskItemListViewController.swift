//
//  ViewController.swift
//  ToDoList
//
//  Created by Keith Martin on 5/18/16.
//  Copyright © 2016 Keith Martin. All rights reserved.
//

import UIKit
import PubNub
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}


struct TaskItem {
    var uuid: String
    var task: String
}

class TaskItemListViewController: UIViewController, PNObjectEventListener, UITableViewDelegate, UITableViewDataSource, PassTaskItemBackDelegate {
    
    var mainChannelName: String = ""
    var deletedChannelName: String = ""
    var taskListItems: [TaskItem] = []
    var deletedTaskItems: [TaskItem] = []
    var allTaskItems: [TaskItem] = []
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 0,y: 0, width: 50, height: 50)) as UIActivityIndicatorView
    let serialQueue: DispatchQueue = DispatchQueue(label: "pageHistoryQueue", attributes: [])
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    var fromAddTaskVC: Bool = false

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.title = mainChannelName + " to-do list"
        showActivityIndicator()
        tableView.dataSource = self
        tableView.delegate = self
        appDelegate.client.add(self)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        //Check if the segue is coming from the add task view controller with flag
        //If it is, don't retrieve history from PubNub
        if !fromAddTaskVC {
            showActivityIndicator()
            serialQueue.async { [unowned self] () -> Void in
                self.deletedTaskItems = self.pageHistory(self.deletedChannelName)
                self.allTaskItems = self.pageHistory(self.mainChannelName)
                self.checkAgainstDeletedAndUpdateTable()
            }
        } else {
            fromAddTaskVC = false
        }
    }
    
    
    //When user swipes to delete, a message is sent to the "deleted" channel
    //This makes sure that when a new user joins, these messages won't be shown in their todo list
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let message : [String : AnyObject] = ["uuid" : taskListItems[(indexPath as NSIndexPath).row].uuid as AnyObject, "taskItem" : taskListItems[(indexPath as NSIndexPath).row].task as AnyObject, "index" : (indexPath as NSIndexPath).row as AnyObject]
            appDelegate.client.publish(message, toChannel: self.deletedChannelName, withCompletion: { (status) in
                self.showActivityIndicator()
                if status.isError == true {
                    self.activityIndicator.stopAnimating()
                }
            })
        }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskListItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell")! as UITableViewCell
        cell.textLabel?.text = taskListItems[(indexPath as NSIndexPath).row].task
        return cell
    }
    
    
    //When a message is received, it is added to the tableview if it's not from the "deleted" channel
    //Otherwise, it's removed from the table
   func client(_ client: PubNub, didReceiveMessage message: PNMessageResult) {
        if message.data.subscription != deletedChannelName {
            activityIndicator.stopAnimating()
            taskListItems.append(TaskItem(uuid: message.data.message!["uuid"] as! String, task: message.data.message!["taskItem"] as! String))
            tableView.reloadData()
        } else {
            activityIndicator.stopAnimating()
            taskListItems.remove(at: message.data.message!["index"] as! Int)
            let indexPath = IndexPath(row: message.data.message!["index"] as! Int, section: 0)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    //Page history of specified channel using semaphore and return array with history task items
    func pageHistory(_ channelName: String) -> [TaskItem] {
        
        var uuidArray: [TaskItem] = []
        var shouldStop: Bool = false
        var isPaging: Bool = false
        var startTimeToken: NSNumber = 0
        let itemLimit: Int = 100
        let semaphore: DispatchSemaphore = DispatchSemaphore(value: 0)
        
        self.appDelegate.client.history(forChannel: channelName, start: nil, end: nil, limit: 100, reverse: true, includeTimeToken: true, withCompletion: { (result, status) in
            for message in (result?.data.messages)! {
                if let resultMessage = message["message"] {
                    uuidArray.append(TaskItem(uuid: resultMessage!["uuid"] as! String, task: resultMessage!["taskItem"] as! String))
                }
            }
            
            if let endTime = result?.data.end {
                startTimeToken = endTime
            }
            
            if result?.data.messages.count == itemLimit {
                    isPaging = true
                }
                semaphore.signal()
            })
        
        semaphore.wait(timeout: DispatchTime.distantFuture)
        
        while isPaging && !shouldStop {
            self.appDelegate.client.history(forChannel: channelName, start: startTimeToken, end: nil, limit: 100, reverse: true, includeTimeToken: true, withCompletion: { (result, status) in
                for message in (result?.data.messages)! {
                    if let resultMessage = message["message"] {
                        uuidArray.append(TaskItem(uuid: resultMessage!["uuid"] as! String, task: resultMessage!["taskItem"] as! String))
                    }
                }
                
                if let endTime = result?.data.end {
                    startTimeToken = endTime
                }
                
                if result?.data.messages.count < itemLimit {
                    shouldStop = true
                }
                semaphore.signal()
            })
            semaphore.wait(timeout: DispatchTime.distantFuture)
        }
        return uuidArray
    }
    
    
    //Check all history items against deleted items and update tableView
    func checkAgainstDeletedAndUpdateTable() {
            for task in self.allTaskItems {
                if !self.deletedTaskItems.contains(where: {$0.uuid == task.uuid}) {
                    self.taskListItems.append(TaskItem(uuid: task.uuid, task: task.task))
                }
            }
        //Update UI on main thread
            DispatchQueue.main.async(execute: { () -> Void in
                self.activityIndicator.stopAnimating()
                self.tableView.reloadData()
            })
    }
    
    
    //Delegate method used to return item from TaskItemViewController
    func passTaskItemBack(_ taskItem: TaskItem) {
            fromAddTaskVC = true
            let message : [String : AnyObject] = ["uuid" : taskItem.uuid as AnyObject, "taskItem" : taskItem.task as AnyObject]
            appDelegate.client.publish(message, toChannel: mainChannelName, withCompletion: nil)
    }
    
    //Set delegate
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let taskItemViewController = segue.destination as! TaskItemViewController
        taskItemViewController.delegate = self
    } 
    
    //Spinning indicator when loading request
    func showActivityIndicator() {
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
}

