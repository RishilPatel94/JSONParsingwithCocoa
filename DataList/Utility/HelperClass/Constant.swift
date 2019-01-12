//
//  Constant.swift
//  DataList
//
//  Created by Rishil Patel on 10/01/19.
//  Copyright © 2019 Rishil Patel. All rights reserved.
//

import UIKit

class Constant: NSObject {
    struct APIConstant {
        static let baseURL = "https://dog.ceo/api/"
    }
    struct TitleStings {
        static let appTitle = "Dog Breeds"
        static let titleBreed = "Breed : "
        static let CountSubBreed = "Total Sub-Breed : "
        static let titleSubBreed = "Sub-Breeds"
    }
    struct FontNames {
        static let TitleFont = UIFont(name:"Arial", size: 18.0)
        static let SubTitleFont = UIFont(name:"Arial", size: 13.0)
    }
    struct FontColor {
        static let TitleColor = UIColor.black
        static let SubTitleColor = UIColor.lightGray
    }
    struct AppColor {
        static let colorTableBackG = UIColor.init(red: 234.0/255.0, green: 255.0/255.0, blue: 240.0/255.0, alpha: 1.0)
    }
    
}
