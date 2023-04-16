//
//  ViewController.swift
//  Ejercicio en clases
//
//  Created by Mac on 27/03/23.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return especie.count
    }
    func assignbackground(){
          let background = UIImage(named: "Fondo")

          var imageView : UIImageView!
          imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
          imageView.clipsToBounds = true
          imageView.image = background
          imageView.center = view.center
          view.addSubview(imageView)
          self.view.sendSubviewToBack(imageView)
      }

    @IBOutlet weak var lblNombre: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        PVPersonaje.dataSource = self
        PVPersonaje.delegate = self
        assignbackground()
    }
    let especie = ["...","Gato","Perro", "Conejo"]

    @IBOutlet weak var PVPersonaje: UIPickerView!
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return especie[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row{
        case 1:
            lblNombre.text = "Gato"
        case 2:
            lblNombre.text = "Perro"
        case 3:
            lblNombre.text = "Conejo"
        default :
            lblNombre.text = ""
        }
        IVImagen.image = nil
        sliEdad.setValue(0.0, animated: true)
    }
    
    @IBOutlet weak var lblEdad: UILabel!
    //AHHHA
    
    @IBOutlet weak var IVImagen: UIImageView!
    //OA
    @IBOutlet weak var sliEdad: UISlider!
    
    
    @IBAction func SlEdad(_ sender: UISlider) {
        let tamaño = sender.value
        lblEdad.text = String(Int(tamaño*10))
        switch lblNombre.text{
        case "Gato":
            if(tamaño <= 0.3){
                IVImagen.image = UIImage(named: "Gato")
            }else if(tamaño > 0.3 && tamaño < 0.7) {
                IVImagen.image = UIImage(named: "GatoJoven")
            } else {
                IVImagen.image = UIImage(named: "GatoAdulto")
            }
        case "Perro":
            if(tamaño <= 0.3){
                IVImagen.image = UIImage(named: "Perro")
            }else if(tamaño > 0.3 && tamaño < 0.7) {
                IVImagen.image = UIImage(named: "PerroJoven")
            } else {
                IVImagen.image = UIImage(named: "PerroAdulto")
            }
        case "Conejo":
            if(tamaño <= 0.3){
                IVImagen.image = UIImage(named: "Conejo")
            }else if(tamaño > 0.3 && tamaño < 0.7) {
                IVImagen.image = UIImage(named: "ConejoJoven")
            } else {
                IVImagen.image = UIImage(named: "ConejoAdulto")
            }
        default :
            IVImagen.image = nil
        }
    }
}

