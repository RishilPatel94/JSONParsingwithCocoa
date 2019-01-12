//
//  BreedTableViewCell.swift
//  DataList
//
//  Created by Rishil Patel on 11/01/19.
//  Copyright © 2019 Rishil Patel. All rights reserved.
//

import UIKit

class BreedTableViewCell: UITableViewCell {
    @IBOutlet var lblBreedName : UILabel!
    @IBOutlet var lblSubCount : UILabel!
    @IBOutlet var imgNextArrow : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setLblFont()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    // MARK: - Hide Arrow When get 0 count of sub breed
    private func hideNextArrow(){
        self.imgNextArrow.isHidden = true
    }
    // MARK: - show Arrow When get more than 0 count of sub breed
    private func showNextArrow(){
        self.imgNextArrow.isHidden = false
    }
    // MARK: - show Arrow When get more than 0 count of sub breed
    private func setLblFont(){
        lblBreedName.font = Constant.FontNames.TitleFont
        lblSubCount.font = Constant.FontNames.SubTitleFont
    }
    // MARK: - set data in label and hide show arrow
    func setDetails(strName: String,numbData : Int){
        if(numbData < 1){
            self.hideNextArrow()
        }else{
            self.showNextArrow()
        }
        lblBreedName.text = Constant.TitleStings.titleBreed + strName
        lblSubCount.text = Constant.TitleStings.CountSubBreed + "\(numbData)"
    }
}
