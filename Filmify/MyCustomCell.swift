//
//  MyCustomCell.swift
//  Filmify
//
//  Created by Jordan Robert Rhodes on 5/26/17.
//  Copyright © 2017 Jordan Robert Rhodes. All rights reserved.
//

import UIKit

class MyCustomCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
