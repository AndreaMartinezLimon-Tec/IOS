//
//  ViewController.swift
//  PokemonPractica
//
//  Created by Carlos on 16/04/23.
//  Copyright © 2023 19100222. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var lblPokemon: UILabel!
    
    @IBOutlet weak var imvImagen: UIImageView!
    let pokemon = ["","Pikachu","Squirtle","Bulbasaur","Charmander","Jigglypuff"]
    
    @IBOutlet weak var pkvPokemon: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblPokemon.text = ""
        lblNumNivel.text = "0"
        pkvPokemon.delegate = self
        pkvPokemon.dataSource = self
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pokemon.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblPokemon.text = pokemon [row]
        switch row{
        case 1:
            lblPokemon.backgroundColor = .yellow
            imvImagen.image = UIImage(named: "Pikachu")
        case 2:
            lblPokemon.backgroundColor = .blue
            imvImagen.image = UIImage(named: "Squirtle")
        case 3:
            lblPokemon.backgroundColor = .green
            imvImagen.image = UIImage(named: "Bulbasaur")
        case 4:
            lblPokemon.backgroundColor = .red
            imvImagen.image = UIImage(named: "Charmander")
        case 5:
            lblPokemon.backgroundColor = UIColor(red: 0.97, green: 0.75, blue: 0.75, alpha: 1.00)
            imvImagen.image = UIImage(named: "Jigglypuff")
        default:
            lblPokemon.backgroundColor = .clear
            lblPokemon.textColor = .black
            imvImagen.image = nil
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pokemon[row]
    }
    
    @IBOutlet weak var seleccionPokemon: UISegmentedControl!
    
    
    @IBAction func SeleccionarPokemon(_ sender: UISegmentedControl) {
    
        let indice = sender.selectedSegmentIndex
        lblPokemon.text = pokemon [indice]
        pkvPokemon.selectRow(indice, inComponent: 0, animated: true)
        switch indice{
        case 1:
            lblPokemon.backgroundColor = .yellow
            imvImagen.image = UIImage(named: "Pikachu")
        case 2:
            lblPokemon.backgroundColor = .blue
            imvImagen.image = UIImage(named: "Squirtle")
        case 3:
            lblPokemon.backgroundColor = .green
            imvImagen.image = UIImage(named: "Bulbasaur")
        case 4:
            lblPokemon.backgroundColor = .red
            imvImagen.image = UIImage(named: "Charmander")
        case 5:
            lblPokemon.backgroundColor = UIColor(red: 0.97, green: 0.75, blue: 0.75, alpha: 1.00)
            imvImagen.image = UIImage(named: "Jigglypuff")
        default:
            lblPokemon.backgroundColor = .clear
            lblPokemon.textColor = .black
            imvImagen.image = nil
        }
    
    }
    @IBOutlet weak var lblNivel: UILabel!
    
    
    @IBOutlet weak var lblNumNivel: UILabel!
    
    @IBAction func sliderNivel(_ sender: UISlider) {
        lblNumNivel.text = String(Int(sender.value * 100))
    }
    
}

