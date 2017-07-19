//
//  ItemTableViewCell.swift
//  IOSWebservice
//
//  Created by Muhammed Thasneem on 18/07/17.
//  Copyright © 2017 Muhammed Thasneem. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var phone: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
