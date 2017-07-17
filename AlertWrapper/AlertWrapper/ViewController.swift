//
//  ViewController.swift
//  AlertWrapper
//
//  Created by Pedro Alonso on 7/13/17.
//  Copyright © 2017 Pedro Alonso. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let alert: AlertWrapper = AlertWrapper(completion: myOKHandler)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let title = "Ok"
        let alertTitle = "Alert"
        let message = "This is an alert"
        
        let okAction: UIAlertAction = UIAlertAction(title: title, style: .default, handler:
            
            myOKHandler)
        
        let cancelAction = UIAlertAction(title: title, style: .cancel, handler:
            
            myCancelHandler)
        
        alert.showAlert(from: self, title: alertTitle, message: message, actions: [okAction, cancelAction], completion: nil)

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let title = "Ok"
        let alertTitle = "Alert"
        let message = "This is an alert"
        
        let okAction: UIAlertAction = UIAlertAction(title: title, style: .default, handler:
            
            myOKHandler)
        
        let cancelAction = UIAlertAction(title: title, style: .cancel, handler:
            
            myCancelHandler)
        
        alert.showAlert(from: self, title: alertTitle, message: message, actions: [okAction, cancelAction], completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func myOKHandler(ok: UIAlertAction) -> Void {
        print("ok")
        print(ok.title!)
        print("You selected ok")
    }
    
    func myCancelHandler(cancel: UIAlertAction) -> Void {
        print("cancel")
        print(cancel.title!)
        print("You selected cancel")
    }
    
    @IBAction func AlertTapped(_ sender: UIButton) {
        let titleOk = "Ok"
        let titleCancel = "Cancel"
        let alertTitle = "Alert"
        let message = "This is an alert"
        
        let okAction: UIAlertAction = UIAlertAction(title: titleOk, style: .default, handler:
            
            myOKHandler)
        
        let cancelAction = UIAlertAction(title: titleCancel, style: .cancel, handler:
            
            myCancelHandler)
        
        alert.showAlert(from: self, title: alertTitle, message: message, actions: [okAction, cancelAction], completion: nil)
    }
}

