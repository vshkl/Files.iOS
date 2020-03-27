//
//  DateViewCell.swift
//  Files.ios
//
//  Created by Pavel Vashkel on 3/27/20.
//  Copyright © 2020 Pavel Vashkel. All rights reserved.
//

import UIKit

class DateViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func onDateChanged(_ sender: UIDatePicker) {
        print(sender)
    }

}
