//
//  CatalogoTableViewCell.swift
//  RapFarmaApp
//
//  Created by Beatriz Duque on 18/10/21.
//

import UIKit
protocol CatalogoTableViewCellDelegate: AnyObject {
    func didAdd()
}

class CatalogoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgProduto: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addProdutct: UIButton!
    
    weak var delegate: CatalogoTableViewCellDelegate?

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func addAction(_ sender: Any) {
        delegate?.didAdd()
        
    }
    
    
}
