//
//  TaskTableViewCell.swift
//  SuicaReadApp
//
//  Created by Miki Arakawa on 2020/06/11.
//  Copyright © 2020 Miki Arakawa. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var TitleLabel: UIView!
    
    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var Title: UILabel!
    
    @IBOutlet weak var descliption: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
