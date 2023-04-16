import Foundation

class Vehiculo {
  private var placas: String
  private var tarifa: Double

      init(placas:String, tarifa: Double){
        self.placas = placas
        self.tarifa = tarifa
    }
        var Placas:String{
        get{return placas}
        set{placas = newValue}
    }
        var Tarifa:Double{
        get{return tarifa}
        set{tarifa = newValue}
    }
      func CalcularImporte() -> Double{
        return Tarifa
    }
}
