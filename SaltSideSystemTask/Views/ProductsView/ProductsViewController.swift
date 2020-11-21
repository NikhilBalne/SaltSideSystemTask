//
//  ViewController.swift
//  SaltSideSystemTask
//
//  Created by Nikhil Balne on 21/11/20.
//

import UIKit

class ProductsViewController: UIViewController {

    @IBOutlet weak var productsTableView: UITableView!
    var productsTableData : [Product]? = nil
    let productsViewModel : ProductViewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getProducts()
    }

    // MARK: - Get Products
    private func getProducts(){
                
        productsViewModel.getProducts { (products) in
            self.productsTableData = products
            
            DispatchQueue.main.async {
                self.productsTableView.reloadData()
            }
        }
        
    }
    
}

// MARK: - Products TableView Delegate and DataSource Methods
extension ProductsViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsTableData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let productsCell = (tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as? ProductTableViewCell)!
        let objProduct = productsTableData?[indexPath.row]
        if let objProduct = objProduct {
            productsCell.setProductCellDetails(product: objProduct)
        }
        
        return productsCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailProductView = self.storyboard?.instantiateViewController(identifier: "ProductsDetailViewController") as? ProductsDetailViewController
        detailProductView?.product = productsTableData?[indexPath.row]
        self.navigationController?.pushViewController(detailProductView!, animated: true)
    }
    
    
}
