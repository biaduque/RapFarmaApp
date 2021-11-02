//
//  MoreInfoViewController.swift
//  RapFarmaApp
//
//  Created by Beatriz Duque on 02/11/21.
//

import UIKit

class MoreInfoViewController: UIViewController {
    public var info: Int!
    @IBOutlet weak var imageInfo: UIImageView!
    @IBOutlet weak var labelInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stilyze()
    }

    func stilyze(){
        if info == 0{
            imageInfo.image = UIImage(systemName: "lightbulb.fill")
            labelInfo.text = "Pesquise por uma farmácia específica com a barra de buscas. Selecione uma farmácia pressionando seu logotipo para acessar seu catálogo de produtos."
        }
        else if info == 1{
            imageInfo.image = UIImage(systemName: "cart.fill")
            labelInfo.text = "Visualize os produtos adicionados no carrinho e suas respectivas quantidades e valores. Pressione o botão 'Fazer pedido' para ser direcionado à tela de conclusão do pedido."
        }
        else if info == 2{
            imageInfo.image = UIImage(systemName: "note.text")
            labelInfo.text = "Consulte a lista de pedidos realizados. Cada pedido pode possuir uma de três cores: Vermelho(Cancelado),Amarelo(Em Andamento) e Verde(Concluído)."
        }
        else{
            imageInfo.image = UIImage(systemName: "person.fill")
            labelInfo.text = "Insira seus dados em cada caixa de texto correspondente. Para alterar a forma de pagamento, pressione o botão 'Trocar'.Para confirmar as alterações feitas, pressione o botão 'Salvar alterações."
        }
    }
    @IBAction func okAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
