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
        showActivityIndicator()
        getProducts()
    }

    // MARK: - Get Products
    private func getProducts(){
                
        productsViewModel.getProducts { (products,error,httpUrlResponse) in
            
            if error == nil {
                print("Error is nil")
            } else {
//                print("Error:\(error)")
            }
            
            if httpUrlResponse?.statusCode == 200 {
                self.productsTableData = products
            } else {
                DispatchQueue.main.async {
                    
                    self.openAlert(title: "Error", message: "Unable to Fetch", alertStyle: .alert, actionTitles: ["Ok","Cancel"], actionStyles: [.default,.cancel], actions: [
                        {_ in
                            print("okay click")
                        },
                        {_ in
                            print("cancel click")
                        }
                    ])
                    
                }
                
            }
        
            DispatchQueue.main.async {
                self.hideActivityIndicator()
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
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(detailProductView!, animated: true)
    }
    
    
}

extension UIViewController{

    // Global Alert
    // Define Your number of buttons, styles and completion
    public func openAlert(title: String,
                          message: String,
                          alertStyle:UIAlertController.Style,
                          actionTitles:[String],
                          actionStyles:[UIAlertAction.Style],
                          actions: [((UIAlertAction) -> Void)]){

        let alertController = UIAlertController(title: title, message: message, preferredStyle: alertStyle)
        for(index, indexTitle) in actionTitles.enumerated(){
            let action = UIAlertAction(title: indexTitle, style: actionStyles[index], handler: actions[index])
            alertController.addAction(action)
        }
        self.present(alertController, animated: true)
    }
}
