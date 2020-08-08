//
//  GenderImage.swift
//  Contact-Book
//
//  Created by Gulnara Saimassay on 7/29/20.
//  Copyright © 2020 Gulnara Saimassay. All rights reserved.
//

import Foundation
import UIKit

enum GenderImage{
    case female
    case male
    
    var image: UIImage{
        switch self {
        case .female:
            return UIImage(named: "female.png")!
        case .male:
            return UIImage(named: "male.png")!
        }
    }
    
}
