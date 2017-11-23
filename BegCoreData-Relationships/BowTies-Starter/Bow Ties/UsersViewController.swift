//
//  UsersViewController.swift
//  Bow Ties
//
//  Created by Luke Parham on 10/30/16.
//  Copyright © 2016 Razeware. All rights reserved.
//

import UIKit
import CoreData

protocol BowTieDelegate {
  func didAssignUser(user: User)
  func didDeleteUser()
}

class UsersViewController: UITableViewController {

  var fetchedResultsController:NSFetchedResultsController<User>!
  var currentBowtie: Bowtie?
  var bowTieDelegate: BowTieDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    insertSampleData()

    reloadData()
//    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
//
//    let fetchRequest:NSFetchRequest<User> = User.fetchRequest()
//    fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
//
//    fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,
//                                                          managedObjectContext: appDelegate.persistentContainer.viewContext,
//                                                          sectionNameKeyPath: nil,
//                                                          cacheName: nil)
//
//    do {
//      try fetchedResultsController.performFetch()
//      tableView.reloadData()
//    } catch let error {
//      print(error)
//    }
  }
  
  func reloadData() {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
    
    let fetchRequest:NSFetchRequest<User> = User.fetchRequest()
    fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
    
    fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                          managedObjectContext: appDelegate.persistentContainer.viewContext,
                                                          sectionNameKeyPath: nil,
                                                          cacheName: nil)
    
    do {
      try fetchedResultsController.performFetch()
      tableView.reloadData()
    } catch let error {
      print(error)
    }
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let user = fetchedResultsController.object(at: indexPath)
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UserTableViewCell
    cell.nameLabel.text = user.name ?? "No name given"

    //Add check indicator
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return fetchedResultsController.sections?[section].numberOfObjects ?? 0
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return fetchedResultsController.sections?.count ?? 0
  }
  
  override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    if let bowTieDelegate = bowTieDelegate {
      bowTieDelegate.didAssignUser(user: fetchedResultsController.object(at: indexPath))
      let _ = navigationController?.popViewController(animated: true)
    }
    
  }
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
      return
    }
    
    if editingStyle == .delete {
      let user = fetchedResultsController.object(at: indexPath)
      appDelegate.persistentContainer.viewContext.delete(user)
      
      do {
        try appDelegate.persistentContainer.viewContext.save()
        bowTieDelegate?.didDeleteUser()
        reloadData()
      } catch let error {
        print(error)
      }
//      tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.top)
    }
  }
}

extension UsersViewController {
  func insertSampleData() {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
    
    let fetch:NSFetchRequest<User> = User.fetchRequest()
    let count = try! appDelegate.persistentContainer.viewContext.count(for: fetch)
    
    if count > 0 {
      // SampleUsers.plist data already in Core Data
      return
    }
    
    let path = Bundle.main.path(forResource: "SampleUsers", ofType: "plist")
    let dataArray = NSArray(contentsOfFile: path!)!
    
    for dict in dataArray {
      let user = User(context: appDelegate.persistentContainer.viewContext)
      let btDict = dict as! [String: String]
      
      user.name = btDict["name"]
    }
    
    try! appDelegate.persistentContainer.viewContext.save()
  }
}
