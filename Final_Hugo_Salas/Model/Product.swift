//
//  Product.swift
//  Final_Hugo_Salas
//
//  Created by Sadohu on 27/10/23.
//

import UIKit

struct Product : Codable{
    var id : Int;
    var title : String;
    var price : Double;
    var description : String;
    var category : String;
    var image : String;
    var rating : Rating;
}
