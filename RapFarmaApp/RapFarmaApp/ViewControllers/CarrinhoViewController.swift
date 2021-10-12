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
    
    private var totalCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionCarrinho.delegate = self
        collectionCarrinho.dataSource = self
        totalLabel.text = "R$\(String(totalCount))"
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cellBase = CarrinhoViewCell()
        
        if let cell: CarrinhoViewCell  = collectionView.dequeueReusableCell(withReuseIdentifier: "carrinhoCell", for: indexPath as IndexPath) as? CarrinhoViewCell {
            cell.backgroundColor = .systemBackground
            cell.stylize()
            totalCount = Int(cell.totalValuePrice.text!) ?? 0 + totalCount
            cellBase = cell
        }
        return cellBase
    }
}
