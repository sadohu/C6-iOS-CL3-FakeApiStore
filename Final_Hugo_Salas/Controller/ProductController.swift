//
//  ProductController.swift
//  Final_Hugo_Salas
//
//  Created by Sadohu on 27/10/23.
//

import UIKit

class ProductController {
    static let URL_API = "https://fakestoreapi.com/products/";
    
    static func getProductsList(delegate : DataLoadedDelegate){
        var list : [Product] = [];
        let url = URL(string: self.URL_API);
        let task = URLSession.shared.dataTask(with: url!) { data, urlResponse, error in
            do{
                if(error == nil){
                    let decodeData = try JSONDecoder().decode([Product].self, from: data!);
                    list = decodeData;
                    DispatchQueue.main.async { delegate.listLoadedSuccessfully(data: list);
                    }
                }
            }catch{
                print(error.localizedDescription);
            }
        }
        task.resume();
    }
    
    static func getProductById(idProduct id : Int, delegate : DataLoadedDelegate){
        var item : Product? = nil;
        let url = URL(string: self.URL_API + String(id));
        let task = URLSession.shared.dataTask(with: url!) { data, urlResponse, error in
            do {
               if let data = data {
                   let decodeData = try JSONDecoder().decode(Product.self, from: data);
                   let item = decodeData;
               }
               DispatchQueue.main.async {
                   if let item = item{
                       delegate.itemLoadedSuccessfully(data: item);
                   }else{
                       delegate.manageNilObject();
                   }
               }
           } catch {
               print(error.localizedDescription);
           }
        }
        task.resume();
    }
    
    static func loadImage(fromURL imgURL : String, into imageView: UIImageView){
        if let url = URL(string: imgURL) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error al cargar la imagen: \(error)")
                } else if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        imageView.image = image;
                    }
                }
            }
            task.resume()
        } else {
            print("Error URL inválido")
        }
    }
    
}
