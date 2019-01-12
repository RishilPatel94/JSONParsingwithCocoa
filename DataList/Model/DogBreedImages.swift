//
//  DogBreedImages.swift
//  DataList
//
//  Created by Rishil Patel on 12/01/19.
//  Copyright © 2019 Rishil Patel. All rights reserved.
//

import Foundation
// Codable class for mapping object from api imagedata
struct DogBreedImages : Codable {
    
    let message : [String]?
    let status : String?
    
    enum CodingKeys: String, CodingKey {
        case message = "message"
        case status = "status"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message =  try values.decodeIfPresent([String].self, forKey: .message)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }
}

