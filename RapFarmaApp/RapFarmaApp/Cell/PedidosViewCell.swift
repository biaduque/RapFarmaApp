//
//  PedidosViewCell.swift
//  RapFarmaApp
//
//  Created by Beatriz Duque on 18/10/21.
//

import UIKit

enum Status: Int{
    case concluido,andamento,cancelado
}

class PedidosViewCell: UITableViewCell {

    @IBOutlet weak var imgFarm: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func stylize(pedido: Pedidos){
        titleLabel.text = pedido.nome
        if pedido.status == Int(0){
            statusView.backgroundColor = .systemGreen
            statusLabel.text = "Concluído"
        }
        else if pedido.status == Int(1){
            statusView.backgroundColor = .systemYellow
            statusLabel.text = "Em andamento"
        }
        else{
            statusView.backgroundColor = .systemRed
            statusLabel.text = "Cancelado"
        }
        imgFarm.image = UIImage(named: pedido.farma ?? "remedioDefault")
        statusView.layer.cornerRadius = 3
    }
}
