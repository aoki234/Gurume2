//
//  reTableViewCell.swift
//  Myloginapp
//
//  Created by aokijun on 2018/08/29.
//  Copyright © 2018年 aokijun. All rights reserved.
//

import UIKit

class ReTableViewCell: UITableViewCell {

    
    @IBOutlet weak var reimageView: UIImageView!
    
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var foodLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
