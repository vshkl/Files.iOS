//
//  EntryViewCell.swift
//  Files.ios
//
//  Created by Pavel Vashkel on 3/27/20.
//  Copyright © 2020 Pavel Vashkel. All rights reserved.
//

import UIKit

class EntryViewCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblExpiry: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
