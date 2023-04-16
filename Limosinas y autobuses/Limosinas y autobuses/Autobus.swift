import Foundation

class Autobus : Vehiculo {
  private var kmInicial: Int
  private var kmFinal: Int

    init(placas:String, tarifa: Double,kmInicial: Int,kmFinal: Int){
        self.kmInicial = kmInicial
        self.kmFinal = kmFinal
      super.init(placas: placas,tarifa:tarifa)
    }
        var KmInicial:Int{
        get{return kmInicial}
        set{kmInicial = newValue}
    }
        var KmFinal:Int{
        get{return kmFinal}
        set{kmFinal = newValue}
    }
      override func CalcularImporte() -> Double{
        let tarifa = super.CalcularImporte()
        return (((Double(kmFinal - kmInicial)) * tarifa))
    }
}
