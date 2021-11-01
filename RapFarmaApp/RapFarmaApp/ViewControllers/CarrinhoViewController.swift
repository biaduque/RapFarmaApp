//
//  CarrinhoViewController.swift
//  RapFarmaApp
//
//  Created by Beatriz Duque on 12/10/21.
//

import UIKit




class CarrinhoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var collectionCarrinho: UICollectionView!
    
    private var totalCount = 0.0

    weak var delegate: FarmaciaViewControllerDelegate?

    private var carrinho:[Produto] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionCarrinho.delegate = self
        collectionCarrinho.dataSource = self
        carrinho = ProdutosData.shared.getProducts()
        reloadTotal()
        
        if let vc = storyboard?.instantiateViewController(identifier: "carrinho") as?
            FarmaciaViewController {
            vc.delegate = self
        }
        
        if let vc = storyboard?.instantiateViewController(identifier: "newPedido") as?
            NewPedidoViewController {
            vc.delegateCarrinho = self
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        carrinho.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cellBase = CarrinhoViewCell()
        
        if let cell: CarrinhoViewCell  = collectionView.dequeueReusableCell(withReuseIdentifier: "carrinhoCell", for: indexPath as IndexPath) as? CarrinhoViewCell {
            cell.backgroundColor = .systemBackground
            cell.productName.text = carrinho[indexPath.row].nome
            cell.priceUnityLabel.text = "R$ \(String(carrinho[indexPath.row].valorUnitario))"
            cell.totalValuePrice.text = "R$ \(String(carrinho[indexPath.row].valorTotal))"
            cell.countLabel.text = String(carrinho[indexPath.row].quantidade)
            
            cell.stylize()
            
            cellBase = cell
        }
        return cellBase
    }
    func reloadTotal(){
        for i in 0..<carrinho.count{
            totalCount = Double(Float(carrinho[i].valorTotal)) + totalCount
        }
        totalLabel.text = (String(format:"R$ %.2f",totalCount))
    }
    
    ///botao que realiza o pedido
    @IBAction func orderAction(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(identifier: "newPedido") as?
                    NewPedidoViewController {
            vc.subtotal = Float(totalCount)
            vc.entrega = Float(12)
            vc.total = Float(totalCount)+Float(12)
            vc.farma = "remedioDefault"
            navigationController?.present(vc, animated: true)
        }
    }
    
}

extension CarrinhoViewController: FarmaciaViewControllerDelegate{
    func addCarrinho() {
        collectionCarrinho.reloadData()
        reloadTotal()
    }
}
