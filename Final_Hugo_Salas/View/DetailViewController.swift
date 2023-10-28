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
    @IBOutlet weak var descriptionProduct: UITextView!
    @IBOutlet weak var categoryProduct: UILabel!
    @IBOutlet weak var rateProduct: UILabel!
    @IBOutlet weak var countProduct: UILabel!
    @IBOutlet weak var imageProduct: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        setNotInfo();
    }
    
    @IBAction func btnFind(_ sender: UIButton) {
        let id = Int(txtIdProduct.text ?? "0") ?? 0;
        if(id == 0){
            ProductController.showAlert(message: "Ingrese un código válido (Número entero y mayor a cero).", viewController: self);
            setNotInfo();
            return;
        }
        ProductController.getProductById(idProduct: id, delegate: self);
    }
    
    func itemLoadedSuccessfully(data: Product) {
        idProduct.text = String(data.id);
        titleProduct.text = data.title;
        priceProduct.text = String(data.price);
        descriptionProduct.text = data.description;
        categoryProduct.text = data.category;
        rateProduct.text = String(data.rating.rate);
        countProduct.text = String(data.rating.count);
        ProductController.loadImage(fromURL: data.image, into: imageProduct);
        txtIdProduct.text = "";
    }
    
    func manageNilObject() {
        ProductController.showAlert(message: "No se encontró resultados con el código ingresado.", viewController: self);
        setNotInfo();
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true);
    }
    
    func setNotInfo(){
        txtIdProduct.text = "";
        idProduct.text = "";
        titleProduct.text = "";
        priceProduct.text = "";
        descriptionProduct.text = "";
        categoryProduct.text = "";
        rateProduct.text = "";
        countProduct.text = "";
        imageProduct.image = nil;
    }
    
    func listLoadedSuccessfully(data: [Product]) {
    }

}
