//
//  feriadosViewController.swift
//  desafioSavingData
//
//  Created by Italo Chesley Gomes da Silva on 18/02/18.
//  Copyright © 2018 Italo Chesley Gomes da Silva. All rights reserved.
//

import UIKit

class feriadosViewController: UIViewController {

    var feriados = ["30 de março - sexta feira santa",
                    "01 de abril - páscoa",
                    "21 de abril - tiradentes",
                    "01 de maio - dia do trabalhador",
                    "31 de maio - corpus christi",
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension feriadosViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feriados.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Feriados 2018"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let row = indexPath.row
        cell.textLabel?.text = feriados[row]
        return cell
    }
}
