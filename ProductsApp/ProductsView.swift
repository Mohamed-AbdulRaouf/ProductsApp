//
//  ViewController.swift
//  ProductsApp
//
//  Created by Esraa on 5/17/19.
//  Copyright © 2019 example. All rights reserved.
//

import UIKit

class ProductsView: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var interactor: ProductsInteractor!
    var arrayOfProducts: Products?

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor = ProductsInteractor(presenter: ProductsPresenter(view: self))
        interactor.getProducts()
    }
}

extension ProductsView: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfProducts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell" , for: indexPath) as? ProductCell {
            cell.configure(product: arrayOfProducts?.productsArray[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
}
