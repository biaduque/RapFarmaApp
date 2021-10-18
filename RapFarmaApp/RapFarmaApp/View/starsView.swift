//
//  starsView.swift
//  RapFarmaApp
//
//  Created by Beatriz Duque on 18/10/21.
//

import UIKit

class starsView: UIView {
    public var rating: Int = 0
    
    public func setRating(rating: Int){
        self.rating = rating
    }
    public func getRating()->Int{
        return self.rating
    }
    ///funcao que preenche a estrela de acordo com a review do livro que eh passada pela API
    public func styleWithRating(vet: [UIImageView]){
        for i in 0..<rating{
            let symbol = UIImage(systemName: "star.fill")
            if let symbol = symbol {
                vet[i].contentMode = .scaleAspectFit
                vet[i].image = symbol
            }
        }
    }
}
