//
//  SubBreedTableViewCell.swift
//  DataList
//
//  Created by Rishil Patel on 12/01/19.
//  Copyright © 2019 Rishil Patel. All rights reserved.
//

import UIKit

class SubBreedTableViewCell: UITableViewCell {
     @IBOutlet var lblSubBreedName : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        lblSubBreedName.font = Constant.FontNames.TitleFont
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setDetails(strName: String){
        lblSubBreedName.text = strName
    }
}
