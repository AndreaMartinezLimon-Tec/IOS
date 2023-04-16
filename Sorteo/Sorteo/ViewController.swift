//
//  ViewController.swift
//  Sorteo
//
//  Created by Mac on 14/04/23.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bombo1.count
    }
    
    
    @IBOutlet weak var lblEquipo1: UILabel!
    @IBOutlet weak var IvEquipo1: UIImageView!
    @IBOutlet weak var lblEquipo2: UILabel!
    @IBOutlet weak var IvEquipo2: UIImageView!
    @IBOutlet weak var lblEquipo3: UILabel!
    @IBOutlet weak var IvEquipo3: UIImageView!
    @IBOutlet weak var lblEquipo4: UILabel!
    @IBOutlet weak var IvEquipo4: UIImageView!
    
    var bombo1 = ["Qatar","Bélgica","Brasil","Francia","Argentina","Inglaterra","España","Portugal"]
    var bombo2 = ["Dinamarca","Paises Bajos","Alemania","Suiza","Croacia","Uruguay","México","EE.UU"]
    var bombo3 = ["Irán","Japón","Serbia","Corea del sur","Túnez","Polonia","Marruecos","Senegal"]
    var bombo4 = ["Arabia Saudita","Ecuador","Ghana","Canadá","Camerún","Australia","Costa Rica","Gales"]
    var equipo = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        PvBombo1.dataSource = self
        PvBombo1.delegate = self
    }
    @IBAction func scBombo(_ sender: UISegmentedControl) {
        let bombo = sender.selectedSegmentIndex
        switch bombo {
        case 0: GenerarAlerta(titulo: "Bombo 1", mensaje: bombo1)
        case 1: GenerarAlerta(titulo: "Bombo 2", mensaje: bombo2)
        case 2: GenerarAlerta(titulo: "Bombo 3", mensaje: bombo3)
        case 3: GenerarAlerta(titulo: "Bombo 4", mensaje: bombo4)
        default: GenerarAlerta(titulo: "Bombo 1", mensaje: bombo1)
        }
    }

    
    @IBAction func btnSorteo(_ sender: UIButton) {
        var seleccion = Seleccion()
        seleccion.verificarEquipo(equipoPrincipal: bombo1[equipo])
        lblEquipo1.text = bombo1[equipo]
        IvEquipo1.image = UIImage(named: bombo1[equipo])
        var equipo2 = seleccion.SortearEquipos(bombo: bombo2)
        lblEquipo2.text = equipo2
        IvEquipo2.image = UIImage(named: equipo2)
        var equipo3 = seleccion.SortearEquipos(bombo: bombo3)
        lblEquipo3.text = equipo3
        IvEquipo3.image = UIImage(named: equipo3)
        var equipo4 = seleccion.SortearEquipos(bombo: bombo4)
        lblEquipo4.text = equipo4
        IvEquipo4.image = UIImage(named: equipo4)
    }
    
    
    @IBOutlet weak var PvBombo1: UIPickerView!
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        bombo1[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        equipo = row
    }
    func GenerarAlerta(titulo:String, mensaje: [String]){
        var texto = ""
        for i in 0...7 {
            texto += "\n\(mensaje[i])"
        }
        let alerta: UIAlertController
        alerta = UIAlertController(title: titulo, message: "\(texto)", preferredStyle: .alert)
        
        alerta.addAction(UIAlertAction(title: "Aceptar", style: .default))
        
        //presentar la alerta
        present(alerta, animated: true)
    }
}

