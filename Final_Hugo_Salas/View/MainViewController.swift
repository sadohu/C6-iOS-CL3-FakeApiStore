//
//  MainViewController.swift
//  Final_Hugo_Salas
//
//  Created by Sadohu on 27/10/23.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, DataLoadedDelegate {
    @IBOutlet weak var tvProducts: UITableView!
    
    var listProducts : [Product] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad();
        tvProducts.dataSource = self;
        tvProducts.delegate = self;
        ProductController.getProductsList(delegate: self);
    }
    
    func listLoadedSuccessfully(data: [Product]) {
        listProducts = [];
        listProducts = data;
        tvProducts.reloadData();
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listProducts.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell") as! ProductTableViewCell;
        cell.lblId.text = String(listProducts[indexPath.row].id);
        cell.lblTitle.text = listProducts[indexPath.row].title;
        return cell;
    }
    
    @IBAction func btnSearchProduct(_ sender: UIButton) {
        performSegue(withIdentifier: "searchProduct", sender: self);
    }
    
    func itemLoadedSuccessfully(data: Product) {
    }
    
    func manageNilObject() {
    }
}
