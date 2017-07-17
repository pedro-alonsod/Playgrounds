//
//  ViewController.swift
//  TestingAlertExperiment
//
//  Created by Dominik Hauser on 02/09/15.
//  Copyright © 2015 Dominik Hauser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var Action = UIAlertAction.self
  var actionString: String?
  
  @IBAction func showAlert(_ sender: UIButton) {
    let alertViewController = UIAlertController(title: "Test Title", message: "Message", preferredStyle: .alert)
    
    let okAction = Action.makeActionWithTitle("OK", style: .default) { (action) -> Void in
        self.actionString = "OK"
    }
    
    let cancelAction = Action.makeActionWithTitle("Cancel", style: .default) { (action) -> Void in
        self.actionString = "Cancel"
    }
    
    alertViewController.addAction(cancelAction)
    alertViewController.addAction(okAction)
    
    present(alertViewController, animated: true, completion: nil)
  }
}

extension UIAlertAction {
    class func makeActionWithTitle(_ title: String?, style: UIAlertActionStyle, handler: ((UIAlertAction) -> Void)?) -> UIAlertAction {
        return UIAlertAction(title: title, style: style, handler: handler)
    }
}
