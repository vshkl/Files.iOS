//
//  AddViewController.swift
//  Files.ios
//
//  Created by Pavel Vashkel on 3/26/20.
//  Copyright © 2020 Pavel Vashkel. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var niTitle: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onCancelButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onSaveButtonPressed(_ sender: UIBarButtonItem) {
    
    }
    
    @IBAction func onSegmentChanged(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0) {
            self.niTitle.title = "New File"
        }
        if (sender.selectedSegmentIndex == 1) {
            self.niTitle.title = "New Note"
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
