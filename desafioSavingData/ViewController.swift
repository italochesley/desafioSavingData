//
//  ViewController.swift
//  desafioSavingData
//
//  Created by Italo Chesley Gomes da Silva on 18/02/18.
//  Copyright © 2018 Italo Chesley Gomes da Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        incrementarContadorUtilizacoesApp()
        if deveSolicitarAvaliacao() {
            zerarContadorUtilizacoesAPP()
            let alert = UIAlertController(title: "Avaliação", message: "Está gostando da app? Então clique em Avaliar para ir a loja da Apple e fazer uma avaliação", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Avaliar", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

    func deveSolicitarAvaliacao() -> Bool {
        
        let userDefaults = UserDefaults.standard
        let contadorUtilizacoes = userDefaults.double(forKey: "contadorUtilizacoes")
        return contadorUtilizacoes >= 2
    }
    
    func zerarContadorUtilizacoesAPP() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(0, forKey: "contadorUtilizacoes")
    }
    
    func incrementarContadorUtilizacoesApp() {
        let userDefaults = UserDefaults.standard
        var contadorUtilizacoes = userDefaults.double(forKey: "contadorUtilizacoes")
        contadorUtilizacoes += 1
        userDefaults.set(contadorUtilizacoes, forKey: "contadorUtilizacoes")
    }
}

