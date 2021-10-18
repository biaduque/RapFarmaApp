//
//  SugestoesViewController.swift
//  RapFarmaApp
//
//  Created by Beatriz Duque on 18/10/21.
//

import UIKit

class SugestoesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var cvSugestoes: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cvSugestoes.delegate = self
        cvSugestoes.dataSource = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cellBase = SugestoesCollectionViewCell()
        
        if let cell: SugestoesCollectionViewCell  = collectionView.dequeueReusableCell(withReuseIdentifier: "sugestoesCell", for: indexPath as IndexPath) as? SugestoesCollectionViewCell {
            cell.backgroundColor = .systemBackground
            cell.stylize()
            cellBase = cell
        }
        return cellBase
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "farmacia") as?
                    FarmaciaViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
