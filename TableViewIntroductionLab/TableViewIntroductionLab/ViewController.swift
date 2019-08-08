//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//  var numOfTasks = Task.allTasks
  
  
  @IBOutlet weak var tableView: UITableView!
  
  let completed = Task.getCompletedTasks()
  let inProgress = Task.getInProgress()
  let notStarted = Task.getNotStarted()
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 0:
      return notStarted.count
    case 1:
      return inProgress.count
    case 2:
      return completed.count
    default:
      return 0
    }
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Names", for: indexPath)
    if indexPath.section == 0 {
      cell.textLabel?.text = notStarted[indexPath.row].name
      cell.detailTextLabel?.text = notStarted[indexPath.row].dueDate.description(with: .current)
    } else if indexPath.section == 1 {
      cell.textLabel?.text = inProgress[indexPath.row].name
      cell.detailTextLabel?.text = inProgress[indexPath.row].dueDate.description(with: .current)
    } else {
      cell.textLabel?.text = completed[indexPath.row].name
      cell.detailTextLabel?.text = completed[indexPath.row].dueDate.description(with: .current)
    }
    return cell
}

  func numberOfSections(in tableView: UITableView) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    switch section {
    case 0:
      return "Not Started"
    case 1:
      return "In Progress"
    case 2:
      return "Completed"
    default:
      return "blah"
    }
  }
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      tableView.dataSource = self
      tableView.delegate = self
        // Do any additional setup after loading the view.
    }


}

