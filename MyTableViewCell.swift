//
//  MyTableViewCell.swift
//  MyPhoto
//
//  Created by Abhishek on 11/07/18.
//  Copyright © 2018 Abhishek Bhagat. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var heroImage: UIImageView!
  
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelTeam: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
