//
//  feriadosViewController.swift
//  desafioSavingData
//
//  Created by Italo Chesley Gomes da Silva on 18/02/18.
//  Copyright © 2018 Italo Chesley Gomes da Silva. All rights reserved.
//

import UIKit

class feriadosViewController: UIViewController {

    var feriados: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preencherFeriadosComPList()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func preencherFeriadosComPList () {
        if let pList = Bundle.main.path(forResource: "feriados", ofType: "plist") {
            let dictionary = NSDictionary(contentsOfFile: pList)
            feriados = dictionary?.object(forKey: "Feriados") as? [String] ?? [""]
        }
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
