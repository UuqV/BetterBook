//
//  EntryTableViewCell.swift
//  BB6
//
//  Created by Kathryn Lovell on 1/14/16.
//  Copyright © 2016 KLovell. All rights reserved.
//

import UIKit

class EntryTableViewCell: UITableViewCell {
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var situation: UILabel!
    @IBOutlet weak var date: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
