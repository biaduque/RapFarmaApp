//
//  SugestoesCollectionViewCell.swift
//  RapFarmaApp
//
//  Created by Beatriz Duque on 18/10/21.
//

import UIKit

class SugestoesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgFarma: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func stylize(index: Int){
        imgFarma.image = UIImage(named: farmaciasData[index].Farmacia)
        titleLabel.text = farmaciasData[index].Farmacia
        layer.cornerRadius = 15
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 2.0)
        layer.shadowRadius = 4.0
        layer.shadowOpacity = 0.2
        layer.masksToBounds = false
    }
}
