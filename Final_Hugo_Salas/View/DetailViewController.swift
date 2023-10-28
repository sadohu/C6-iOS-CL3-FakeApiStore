//
//  DetailViewController.swift
//  Final_Hugo_Salas
//
//  Created by Sadohu on 27/10/23.
//

import UIKit

class DetailViewController: UIViewController, DataLoadedDelegate {
    @IBOutlet weak var txtIdProduct: UITextField!
    @IBOutlet weak var idProduct: UILabel!
    @IBOutlet weak var titleProduct: UILabel!
    @IBOutlet weak var priceProduct: UILabel!
    @IBOutlet weak var descriptionProduct: UILabel!
    @IBOutlet weak var categoryProduct: UILabel!
    @IBOutlet weak var rateProduct: UILabel!
    @IBOutlet weak var countProduct: UILabel!
    @IBOutlet weak var imageProduct: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    @IBAction func btnFind(_ sender: UIButton) {
        
    }
    
    func itemLoadedSuccessfully(data: Product) {
        <#code#>
    }
    
    func manageNilObject() {
        <#code#>
    }
    
    func listLoadedSuccessfully(data: [Product]) {
        <#code#>
    }

}
