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
    @IBOutlet weak var tvEntries: UITableView!
    
    var segmentIndex: Int = 0
    var files: [Entry] = []
    var notes: [Entry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tvEntries.dataSource = self
    }

    @IBAction func onSegmentChanged(_ sender: UISegmentedControl) {
        self.segmentIndex = sender.selectedSegmentIndex
        
        if (self.segmentIndex == 0) {
            self.niTitle.title = "All Files"
            self.tvEntries.reloadData()
            return
        }
        
        if (self.segmentIndex == 1) {
            self.niTitle.title = "All Notes"
            self.tvEntries.reloadData()
            return
        }
    }
    
    func getEntries() -> [Entry] {
        if (self.segmentIndex == 0) {
            return self.files
        } else if (self.segmentIndex == 1) {
            return self.notes
        } else {
            return []
        }
    }
    
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(self.segmentIndex) {
            case 0:
                return self.files.capacity
            case 1:
                return self.notes.capacity
            default:
                return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellRow = tableView.dequeueReusableCell(withIdentifier: "EntryCell", for: indexPath) as! EntryViewCell
        
        let entry: Entry = self.getEntries()[indexPath.row]
        cellRow.lblTitle.text = entry.name
        cellRow.lblExpiry.text = getFormattedDate(entry.expiry)
        
        return cellRow
    }
    
    func getFormattedDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, YYYY"
        
        return dateFormatter.string(from: date)
    }
    
}
