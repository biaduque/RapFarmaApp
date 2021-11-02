//
//  ContaViewController.swift
//  RapFarmaApp
//
//  Created by Beatriz Duque on 12/10/21.
//

import UIKit

class ContaViewController: UIViewController {

    @IBOutlet weak var infosTable: UITableView!
    @IBOutlet weak var saveInfosButton: UIButton!
    
    let inputConta = ["Nome","Endereço","E-mail","CPF"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infosTable.delegate = self
        infosTable.dataSource = self
        // Do any additional setup after loading the view.
    }
    func alertSave(){
        let ac = UIAlertController(title:"Alterações salvas", message: "As alterações realizadas em sua conta foram salvas!", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {
                [weak self] action in
                //
        }))
        present(ac, animated: true)
    }
    
    @IBAction func saveAction(_ sender: Any) {
        alertSave()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! MoreInfoViewController
        vc.info = 3
    }
}

extension ContaViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ///clique na celula
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadInputViews()
    }
}

extension ContaViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! ContaTableViewCell
        cell.textField.placeholder = inputConta[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
}

