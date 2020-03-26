//
//  ViewController.swift
//  Files.ios
//
//  Created by Pavel Vashkel on 3/26/20.
//  Copyright © 2020 Pavel Vashkel. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var niTitle: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onSegmentChanged(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0) {
            self.niTitle.title = "All Files"
        }
        if (sender.selectedSegmentIndex == 1) {
            self.niTitle.title = "All Notes"
        }
    }
}
