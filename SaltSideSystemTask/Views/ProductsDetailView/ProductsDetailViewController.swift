//
//  ProductsDetailViewController.swift
//  SaltSideSystemTask
//
//  Created by Nikhil Balne on 21/11/20.
//

import UIKit
import Kingfisher

class ProductsDetailViewController: UIViewController {

    var product : Product? = nil
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageViewLabel: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
    }
    
    // MARK: - Setting up Label's Data
    func setUpView(){
        self.titleLabel.text = product?.title
        self.descriptionLabel.text = product?.description
        self.imageViewLabel.kf.indicatorType = .activity
        self.imageViewLabel.kf.setImage(with: URL(string: (product?.image)!)!)
    }
    
}


