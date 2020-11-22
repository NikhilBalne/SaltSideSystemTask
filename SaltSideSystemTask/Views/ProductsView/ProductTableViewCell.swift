//
//  ProductTableViewCell.swift
//  SaltSideSystemTask
//
//  Created by Nikhil Balne on 21/11/20.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    func setProductCellDetails(product:Product){
        self.titleLabel.text = product.title
        self.descriptionLabel.text = product.description
        
        // MARK: - CardView Effect
        cardView.layer.cornerRadius = 20.0
        cardView.layer.shadowColor = UIColor.gray.cgColor
        cardView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        cardView.layer.shadowRadius = 12.0
        cardView.layer.shadowOpacity = 0.7
        
    }
    
}
