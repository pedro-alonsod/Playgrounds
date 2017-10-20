//
//  ViewController.swift
//  AstoTorch
//
//  Created by Pedro Alonso on 10/18/17.
//  Copyright © 2017 Pedro Alonso. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var blueBtnOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.cyan
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func blueBtnTapped(_ sender: UIButton) {
        print(sender.setTitle("Tapped", for: UIControlState.selected))
        self.view.backgroundColor = (self.view.backgroundColor == UIColor.red) ? UIColor.blue:UIColor.red
    }
    
}

