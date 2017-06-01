//
//  myListCell.swift
//  Filmify
//
//  Created by Jordan Robert Rhodes on 5/31/17.
//  Copyright © 2017 Jordan Robert Rhodes. All rights reserved.
//

import UIKit

class myListCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    
    private var _model: Movie?
    
    var model: Movie {
        
        get{
            return _model!
        }
        
        set{
            _model = newValue
            dostuffs()
            
        }
        
        
    }
    func dostuffs() {
        titleLabel.text = _model?.title
        
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
