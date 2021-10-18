//
//  PedidosViewController.swift
//  RapFarmaApp
//
//  Created by Beatriz Duque on 18/10/21.
//

import UIKit

class PedidosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var tablePedidos: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tablePedidos.delegate = self
        tablePedidos.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pedidosCell", for: indexPath) as! PedidosViewCell
        cell.stylize()
        return cell
    }
}
