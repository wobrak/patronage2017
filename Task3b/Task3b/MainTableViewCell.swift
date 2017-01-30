//
//  MainTableViewCell.swift
//  Task3b
//
//  Created by RKB on 26/01/2017.
//  Copyright © 2017 RKB. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cellImie: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
