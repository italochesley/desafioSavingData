//
//  ViewController.swift
//  desafioSavingData
//
//  Created by Italo Chesley Gomes da Silva on 18/02/18.
//  Copyright © 2018 Italo Chesley Gomes da Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let keyContadorUtilizacoes = "contadorUtilizacoes"
    let keyDesafioSavingData = "group.desafioSavingData"
    let keyParametroNumeroVisitas = "parametroNumeroVisitas"
    
    @IBOutlet weak var contadorNumeroVisitasLabel: UILabel!
    @IBOutlet weak var parametroNumeroVisitasLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        solicitarAvaliacao()
        setarLabels()
    }
    
    func setarLabels() {
        contadorNumeroVisitasLabel.text = "Visitas: \(obterNumeroVisitas())"
        parametroNumeroVisitasLabel.text = "Parâmetro: \(obterParametroNumeroVisitas())"
    }
    
    func solicitarAvaliacao() {
        incrementarContadorUtilizacoesApp()
        if deveSolicitarAvaliacao() {
            zerarContadorUtilizacoesAPP()
            let alert = UIAlertController(title: "Avaliação", message: "Está gostando da app? Então clique em Avaliar para ir a loja da Apple e fazer uma avaliação", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Avaliar", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func obterNumeroVisitas() -> Double {
        let userDefaults = UserDefaults.standard
        return userDefaults.double(forKey: keyContadorUtilizacoes)
    }
    func deveSolicitarAvaliacao() -> Bool {
        let contadorUtilizacoes:Double = obterNumeroVisitas()
        return contadorUtilizacoes >= obterParametroNumeroVisitas()
    }
    
    func zerarContadorUtilizacoesAPP() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(0, forKey: keyContadorUtilizacoes)
    }
    
    func incrementarContadorUtilizacoesApp() {
        let userDefaults = UserDefaults.standard
        var contadorUtilizacoes = userDefaults.double(forKey: keyContadorUtilizacoes)
        contadorUtilizacoes += 1
        userDefaults.set(contadorUtilizacoes, forKey: keyContadorUtilizacoes)
    }
    
    func obterParametroNumeroVisitas() -> Double {
        let userDefaults = UserDefaults(suiteName: keyDesafioSavingData)
        return userDefaults?.double(forKey: keyParametroNumeroVisitas) ?? 1
    }
}

