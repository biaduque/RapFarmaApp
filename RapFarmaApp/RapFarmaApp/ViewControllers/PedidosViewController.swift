//
//  PedidosViewController.swift
//  RapFarmaApp
//
//  Created by Beatriz Duque on 18/10/21.
//

import UIKit

class PedidosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var tablePedidos: UITableView!
     var pedidosData: [Pedidos]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tablePedidos.delegate = self
        tablePedidos.dataSource = self
        pedidosData = PedidosData.shared.getOrder().reversed()
        
        if let vc = storyboard?.instantiateViewController(identifier: "newPedido") as?
            NewPedidoViewController {
            vc.delegate = self
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pedidosData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pedidosCell", for: indexPath) as! PedidosViewCell
        cell.stylize(pedido: pedidosData[indexPath.row])
        return cell
    }
}

extension PedidosViewController: NewPedidoViewControllerDelegate{
    func addOrder() {
        tablePedidos.reloadData()
    }
    
}
