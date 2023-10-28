//
//  DataLoadedDelegate.swift
//  Final_Hugo_Salas
//
//  Created by Sadohu on 27/10/23.
//

import UIKit

protocol DataLoadedDelegate: AnyObject {
    func listLoadedSuccessfully(data: [Product]);
    func itemLoadedSuccessfully(data: Product);
    func manageNilObject();
}
