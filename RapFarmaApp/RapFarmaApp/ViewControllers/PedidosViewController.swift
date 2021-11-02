//
//  PedidosViewController.swift
//  RapFarmaApp
//
//  Created by Beatriz Duque on 18/10/21.
//

import UIKit
import CoreData

class PedidosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
    

    @IBOutlet weak var tablePedidos: UITableView!
     var pedidosData: [Pedidos] = []
    
    private lazy var fetchResultController: NSFetchedResultsController<Pedidos> = {
        let request: NSFetchRequest<Pedidos> = Pedidos.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Pedidos.status, ascending: false)]
        let frc = NSFetchedResultsController(fetchRequest: request,
                                             managedObjectContext: ProdutosData.shared.contenxt,
                                             sectionNameKeyPath: nil,
                                             cacheName: nil)
        frc.delegate = self
        return frc
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.pedidosData = PedidosData.shared.getOrder().reversed()
        self.tablePedidos.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tablePedidos.delegate = self
        tablePedidos.dataSource = self
        pedidosData = PedidosData.shared.getOrder().reversed()
        
        if let vc = storyboard?.instantiateViewController(identifier: "newPedido") as?
            NewPedidoViewController {
            vc.delegate = self
        }
        
        do {
            try fetchResultController.performFetch()
            self.pedidosData = fetchResultController.fetchedObjects ?? []
        } catch {
            fatalError("erro")
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let newPedidos = controller.fetchedObjects as? [Pedidos] else { return }
        self.pedidosData = newPedidos.reversed()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pedidosData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pedidosCell", for: indexPath) as! PedidosViewCell
        cell.stylize(pedido: pedidosData[indexPath.row])
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! MoreInfoViewController
        vc.info = 2
    }
}

extension PedidosViewController: NewPedidoViewControllerDelegate{
    func addOrder() {
        tablePedidos.reloadData()
    }
    
}
