//
//  AlertWrapper.swift
//  AlertWrapper
//
//  Created by Pedro Alonso on 7/13/17.
//  Copyright © 2017 Pedro Alonso. All rights reserved.
//

import Foundation
import UIKit

class AlertWrapper {
    
    var completion: ((UIAlertAction) -> Void)?
    var seconCom: (()-> Void)?
    
    init(completion: ((_ act: UIAlertAction) -> Void)?) {
        self.completion = completion
    }
    
    func showAlert(from: UIViewController, title: String, message: String, actions: [UIAlertAction], completion: (() -> Void)?) {
        
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        for action in actions {
            alert.addAction(action)
        }
        
        presentViewController(alert: alert, animated: true, completion: completion)
    }
    
    private func presentViewController(alert: UIAlertController, animated flag: Bool, completion: (() -> Void)?) -> Void {
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: completion)
    }
    
    func doCompletion(act: UIAlertAction) {
        completion!(act)
    }
    
    
}
