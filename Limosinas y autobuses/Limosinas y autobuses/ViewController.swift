//
//  ViewController.swift
//  Limosinas y autobuses
//
//  Created by Mac on 13/04/23.
//

import UIKit

class ViewController: UIViewController {
//xd
    
    @IBOutlet weak var lblTarifa: UILabel!
    @IBOutlet weak var lblPrecio: UILabel!
    @IBOutlet weak var lblKmFinales: UILabel!
    @IBOutlet weak var txtPlacas: UITextField!
    @IBOutlet weak var txtTarifa: UITextField!
    @IBOutlet weak var txtPrecio: UITextField!
    @IBOutlet weak var txtKmFinales: UITextField!
    @IBOutlet weak var lblTicket: UILabel!
    var seleccion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblTarifa.text = "Precio por km:"
        lblPrecio.text = "Kilometro inicial:"
        lblKmFinales.text = "Kilometro final:"
        lblTicket.text = ""
        lblTicket.backgroundColor = .white
    }

    @IBAction func SeleccionarVehiculo(_ sender: UISegmentedControl) {
        lblTicket.backgroundColor = .white
        seleccion = sender.selectedSegmentIndex
        switch seleccion {
        case 0:
            lblTarifa.text = "Precio por km:"
            lblPrecio.text = "Kilometro inicial:"
            lblKmFinales.isHidden = false
            txtKmFinales.isHidden = false
            lblTicket.text = ""
            lblTicket.backgroundColor = .white
        case 1:
            lblTarifa.text = "Precio por día:"
            lblPrecio.text = "Días rentado:"
            lblKmFinales.isHidden = true
            txtKmFinales.isHidden = true
            lblTicket.text = ""
            lblTicket.backgroundColor = .white
        default:
            lblTarifa.text = "Precio por km:"
            lblPrecio.text = "Kilometro inicial:"
            lblKmFinales.isHidden = false
            txtKmFinales.isHidden = false
            lblTicket.text = ""
            lblTicket.backgroundColor = .white
        }
    }
    //xd
    
    @IBAction func btnCalcular(_ sender: UIButton) {
        var importe = 0.0
        var tipoVehiculo = ""
        var facturar = ""
        let placas = txtPlacas.text!
        let tarifa = Double(txtTarifa.text!)!
        let precio = Int(txtPrecio.text!)!
        var kmFinales = 0
        if !txtKmFinales.isHidden {
            kmFinales = Int(txtKmFinales.text!)!
        }
        switch seleccion {
        case 0:
            tipoVehiculo = "Autobus"
            facturar = "Kms a facturar: \(kmFinales - precio)"
            let autobus = Autobus(placas: placas, tarifa: tarifa, kmInicial: precio, kmFinal: kmFinales)
            importe = autobus.CalcularImporte()
        case 1:
            tipoVehiculo = "Limosina"
            facturar = "Días a facturar: \(precio)"
            let limosina = Limosina(placas: placas, tarifa: tarifa, diasTotales: precio)
            importe = limosina.CalcularImporte()
        default:
            lblTicket.text = String(importe)
        }
        let swiftColor = UIColor(red: 0.85, green: 0.69, blue: 0.52, alpha: 1.00)
        lblTicket.text = "Tipo de vehiculo: \(tipoVehiculo)\nPlacas: \(placas)\nPrecio por día: \(tarifa)\n\(facturar)\nTotal a pagar: $\(importe)"
        lblTicket.backgroundColor = swiftColor
    }
}

