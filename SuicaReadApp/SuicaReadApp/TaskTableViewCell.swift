//
//  TaskTableViewCell.swift
//  SuicaReadApp
//
//  Created by Miki Arakawa on 2020/06/11.
//  Copyright © 2020 Miki Arakawa. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {


    
    @IBOutlet weak var iconView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
