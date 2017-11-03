//
//  DpTableViewCell.swift
//  ParsingDataPopulation
//
//  Created by DOTS2 on 11/3/17.
//  Copyright © 2017 Arjuna. All rights reserved.
//

import UIKit

class DpTableViewCell: UITableViewCell {
    @IBOutlet weak var labelRank: UILabel!
    @IBOutlet weak var labelCountryy: UILabel!
    @IBOutlet weak var labelPopulationn: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
