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
    @IBOutlet weak var tvInputs: UITableView!
    
    var segmentIndex: Int = 0
    var isDatePickerShown: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tvInputs.estimatedRowHeight = 44.0
        self.tvInputs.rowHeight = UITableView.automaticDimension
        self.tvInputs.tableFooterView = UIView(frame: .zero)
        self.tvInputs.dataSource = self
        self.tvInputs.delegate = self
    }
    
    @IBAction func onCancelButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onSaveButtonPressed(_ sender: UIBarButtonItem) {
    
    }
    
    @IBAction func onSegmentChanged(_ sender: UISegmentedControl) {
        self.segmentIndex = sender.selectedSegmentIndex
        
        if (self.segmentIndex == 0) {
            self.niTitle.title = "New File"
            self.tvInputs.reloadData()
        } else if (self.segmentIndex == 1) {
            self.niTitle.title = "New Note"
            self.tvInputs.reloadData()
        } else {
            return
        }
    }

}

extension AddViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.isDatePickerShown ? 4 : 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (self.isDatePickerShown) {
            switch indexPath.row {
            case 0:
                return renderExpiryRow(tableView: tableView, indexPath: indexPath)
            case 1:
                return renderDateRow(tableView: tableView, indexPath: indexPath)
            case 2:
                return renderFileRow(tableView: tableView, indexPath: indexPath)
            case 3:
                return renderNoteRow(tableView: tableView, indexPath: indexPath)
            default:
                return UITableViewCell()
            }
        } else {
            switch indexPath.row {
            case 0:
                return renderExpiryRow(tableView: tableView, indexPath: indexPath)
            case 1:
                return renderFileRow(tableView: tableView, indexPath: indexPath)
            case 2:
                return renderNoteRow(tableView: tableView, indexPath: indexPath)
            default:
                return UITableViewCell()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tvInputs.deselectRow(at: indexPath, animated: true)
        
        if (indexPath.row == 0) {
            self.tvInputs.beginUpdates()

            if (self.isDatePickerShown) {
                self.isDatePickerShown = false
                self.tvInputs
                    .deleteRows(at: [IndexPath(row: indexPath.row + 1, section: indexPath.section)], with: .fade)
            } else {
                self.isDatePickerShown = true
                self.tvInputs
                    .insertRows(at: [IndexPath(row: indexPath.row + 1, section: indexPath.section)], with: .fade)
            }

            self.tvInputs.endUpdates()
        }
    }
    
    func renderExpiryRow(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cellRow = tableView.dequeueReusableCell(withIdentifier: "ExpiryCell", for: indexPath) as! ExpiryViewCell
        
        return cellRow
    }
    
    func renderDateRow(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cellRow = tableView.dequeueReusableCell(withIdentifier: "DateCell", for: indexPath) as! DateViewCell
        
        return cellRow
    }
    
    func renderFileRow(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cellRow = tableView.dequeueReusableCell(withIdentifier: "FileCell", for: indexPath) as! FileViewCell
        
        return cellRow
    }
    
    func renderNoteRow(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cellRow = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath) as! NoteViewCell
        
        return cellRow
    }
    
}
