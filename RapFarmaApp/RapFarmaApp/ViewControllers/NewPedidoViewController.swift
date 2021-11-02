//
//  NewPedidoViewController.swift
//  RapFarmaApp
//
//  Created by Beatriz Duque on 01/11/21.
//

import UIKit

protocol NewPedidoViewControllerDelegate: AnyObject{
    func addOrder()
}


class NewPedidoViewController: UIViewController {

    @IBOutlet weak var subtotalLabel: UILabel?
    @IBOutlet weak var entregaLabel: UILabel?
    @IBOutlet weak var totalLabel: UILabel?
    @IBOutlet weak var textField: UITextField!
    
    public var subtotal:Float!
    public var entrega: Float!
    public var total: Float!
    public var farma: String!
    
    weak var delegate: NewPedidoViewControllerDelegate?
    weak var delegateCarrinho: FarmaciaViewControllerDelegate?
    
    override func viewWillAppear(_ animated: Bool) {
        subtotalLabel?.text = String(format:"R$%.2f",subtotal)
        entregaLabel?.text = "R$ \(String(entrega))"
        totalLabel?.text = String(format:"R$%.2f",total)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    }
    @IBAction func cancelButton(_ sender: Any) {
                ///alerta de cancelar
        let ac = UIAlertController(title: "", message: "Tem certeza de que deseja cancelar a finalização do pedido?", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Sim", style: .destructive, handler: {
                [self] action in
                    ///opcoes de cancelamento
                    self.dismiss(animated: true, completion: nil)

            }))
            ac.addAction(UIAlertAction(title: "Continuar", style: .cancel, handler: nil))
            present(ac, animated: true)
        
    }
    
    @IBAction func newOrderButton(_ sender: Any) {
        PedidosData.shared.addOrder(nome: "Pedido \(totalLabel?.text ?? "Novo Pedido")", status:Int32(1), farma: "remedioDefault")
        
        var carrinho = ProdutosData.shared.getProducts()
        while carrinho.count != 0{
            try! ProdutosData.shared.deleta(item: carrinho.first!)
            carrinho = ProdutosData.shared.getProducts()
        }
        
        delegate?.addOrder()
        delegateCarrinho?.addCarrinho()
        self.dismiss(animated: true, completion: nil)
    }
}

extension NewPedidoViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    ///essa funcao faz com que a tecla return do teclado faca o app aceitar a entrada e o teclado abaixe
        textField.autocapitalizationType = .words
        textField.resignFirstResponder()
        return true
    }
}
