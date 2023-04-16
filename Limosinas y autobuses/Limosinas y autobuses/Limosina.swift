import Foundation

class Limosina : Vehiculo {
  private var diasTotales: Int

    init(placas:String, tarifa: Double,diasTotales: Int){
      self.diasTotales = diasTotales
      super.init(placas: placas,tarifa:tarifa)
    }
        var DiasTotales:Int{
        get{return diasTotales}
        set{diasTotales = newValue}
    }

      override func CalcularImporte() -> Double{
        let tarifa = super.CalcularImporte()
        return ((Double(diasTotales) * tarifa))
    }
}
