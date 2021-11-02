//
//  ContaTableViewCell.swift
//  RapFarmaApp
//
//  Created by Beatriz Duque on 12/10/21.
//

import UIKit

class ContaTableViewCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.delegate = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
extension ContaTableViewCell: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    ///essa funcao faz com que a tecla return do teclado faca o app aceitar a entrada e o teclado abaixe
        textField.autocapitalizationType = .words
        textField.resignFirstResponder()
        return true
    }
}

