//
//  SubscribedListViewController.swift
//  ToDoList
//
//  Created by Keith Martin on 5/31/16.
//  Copyright © 2016 Keith Martin. All rights reserved.
//

import UIKit
import PubNub

class SubscribedListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PNObjectEventListener {
    
    var channels: [String] = []
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let row = tableView.indexPathForSelectedRow {
            self.tableView.deselectRow(at: row, animated: false)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return channels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "channelCell")! as UITableViewCell
        cell.textLabel?.text = channels[(indexPath as NSIndexPath).row]
        return cell
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Set the channel names from the selected row
        if let destinationVC = segue.destination as? TaskItemListViewController {
            destinationVC.mainChannelName = channels[(tableView.indexPathForSelectedRow! as NSIndexPath).row]
            destinationVC.deletedChannelName = destinationVC.mainChannelName + "-deleted"
        }
    }
}
