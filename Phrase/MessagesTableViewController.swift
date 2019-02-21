//
//  MessagesTableViewController.swift
//  Phrase
//
//  Created by Valentin Knabel on 15.02.19.
//  Copyright © 2019 Valentin Knabel. All rights reserved.
//

import UIKit

class MessagesTableViewController: UITableViewController {
    let conversation: Conversation
    var messages: [Message]? = mockedMessages
    
    init(conversation: Conversation) {
        self.conversation = conversation
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerNibCellType(MessageTableViewCell.self)
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.separatorInset = .zero
        tableView.backgroundColor = .black
        tableView.insetsLayoutMarginsFromSafeArea = true
        tableView.insetsContentViewsToSafeArea = true
        tableView.contentInset = .init(top: marginUnits(8), left: 0, bottom: marginUnits(1), right: 0)
        tableView.indicatorStyle = .white
        tableView.rowHeight = UITableView.automaticDimension
        tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return messages?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(type: MessageTableViewCell.self, for: indexPath)
        cell.contentView.transform = CGAffineTransform(scaleX: 1,y: -1)
        
        cell.conversation = conversation
        cell.message = messages![indexPath.row]
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
