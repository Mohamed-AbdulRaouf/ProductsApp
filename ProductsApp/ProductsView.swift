//
//  ViewController.swift
//  ProductsApp
//
//  Created by Esraa on 5/17/19.
//  Copyright © 2019 example. All rights reserved.
//

import UIKit

protocol ProductsViewDelegate {
    func reloadTableView(_ products: [Product])
    func showAlert(_ error: String)
}

class ProductsView: UIViewController, ProductsViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var interactor: ProductsInteractor!
    var productsArray: [Product] = []
    var productsViewDelegate: ProductsViewDelegate = ProductsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor = ProductsInteractor(presenter: ProductsPresenter(view: productsViewDelegate))
        interactor.getProducts()
    }

    func reloadTableView(_ products: [Product]) {
        productsArray = products
        tableView.reloadData()
    }
    
    func showAlert(_ error: String) {
        alert(title: "", message: error, actions: [("Ok", .default)])
    }
}

extension ProductsView: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell" , for: indexPath) as? ProductCell {
            cell.configure(product: productsArray[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
}
