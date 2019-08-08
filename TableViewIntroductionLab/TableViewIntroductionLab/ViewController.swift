//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  var numOfTasks = Task.allTasks
  
  
  @IBOutlet weak var tableView: UITableView!
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return numOfTasks.count
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Names", for: indexPath)
    if indexPath.section == 0 {
    cell.textLabel?.text = numOfTasks[indexPath.row].name
    cell.detailTextLabel?.text = numOfTasks[indexPath.row].dueDate.description(with: .current)
  }
    return cell
}

    override func viewDidLoad() {
        super.viewDidLoad()
      tableView.dataSource = self
        // Do any additional setup after loading the view.
    }


}

