//
//  FarmaciaViewController.swift
//  RapFarmaApp
//
//  Created by Beatriz Duque on 18/10/21.
//

import UIKit

protocol FarmaciaViewControllerDelegate: AnyObject{
    func addCarrinho()
}

class FarmaciaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITabBarControllerDelegate {

    @IBOutlet weak var tableCatalogo: UITableView!
    
    @IBOutlet weak var distanceLabel: UILabel?
    @IBOutlet weak var endLabel: UILabel?
    @IBOutlet weak var starsView: starsView?
    
    @IBOutlet weak var goCarrinhoButton: UIButton!
    
    ///estrelas
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    private lazy var vetStars: [UIImageView] = [star1,star2,star3,star4,star5]

    private var carrinho: [Produto] = []
    
    public var farmaciaSelected: Farmacias!
    
    weak var delegate: FarmaciaViewControllerDelegate?

    override func viewWillAppear(_ animated: Bool) {
        setContent()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        tableCatalogo.delegate = self
        tableCatalogo.dataSource = self
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "catalogoCell", for: indexPath) as! CatalogoTableViewCell
        cell.delegate = self
        cell.contentCell = farmaciaSelected.Catalogo[indexPath.row]
        cell.setContent(Catalogo: farmaciaSelected.Catalogo[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ///clique na celula
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadInputViews()
    }

    
    @IBAction func goCarrinhoButton(_ sender: Any) {
        delegate?.addCarrinho()
        tabBarController?.selectedIndex = 1

    }

    func setContent(){
        ///
        navigationItem.title = farmaciaSelected.Farmacia
        ///distancia
        distanceLabel?.text = farmaciaSelected.Distancia
        ///endereco
        endLabel?.text = farmaciaSelected.Endereco
        ///rating
        starsView?.setRating(rating: farmaciaSelected.Rating)
        starsView?.styleWithRating(vet: vetStars)
        ///catalogo de produtos
        
    }
}

///funcoes delegate utilizadas para atualizar o conteudo da view
extension FarmaciaViewController: CatalogoTableViewCellDelegate{
    func didAdd(content: Farmacias.Catalogo) {
        let ac = UIAlertController(title:"Produto adicionado", message: "O produto foi adicionado em seu carrinho.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {
                [weak self] action in
                ///adiciona no carrinho quando clica no botao
                self?.carrinho = ProdutosData.shared.getProducts()
                
                if !((self?.carrinho.isEmpty)!){
                    let exists = self?.carrinho.filter{ $0.nome == content.Remedio }
                    //so adiciona um novo livro se ele ainda nao foi adicionado
                    if exists?.count == 0{
                        ProdutosData.shared.addProducts(nome: content.Remedio, quantidade: Int32(1), valorUni: Float(content.Preco) ?? 0.0)
                        
                    }
                    else{
                        ProdutosData.shared.setQuantidade(produto: (exists?[0])!)
                        ProdutosData.shared.setValorTotal(produto: (exists?[0])!, quantidade: (exists?[0].quantidade)!)
                    }
                }
                else{
                    ProdutosData.shared.addProducts(nome: content.Remedio, quantidade: Int32(1), valorUni: Float(content.Preco) ?? 0.0)
                }
                ProdutosData.shared.saveContext()

                
            
        }))
        delegate?.addCarrinho()
        present(ac, animated: true)
    }
}
