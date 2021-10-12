//
//  CarrinhoViewCell.swift
//  RapFarmaApp
//
//  Created by Beatriz Duque on 12/10/21.
//

import UIKit

class CarrinhoViewCell: UICollectionViewCell {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var priceUnityLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var totalValuePrice: UILabel!
    
    func stylize(){
        layer.cornerRadius = 15
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 2.0)
        layer.shadowRadius = 4.0
        layer.shadowOpacity = 0.2
        layer.masksToBounds = false
    }
}
