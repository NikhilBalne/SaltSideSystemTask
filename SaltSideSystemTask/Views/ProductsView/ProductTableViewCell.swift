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
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOpacity = 1
        cardView.layer.shadowOffset = .zero
        cardView.layer.shadowRadius = 5
        
    }
    
}
