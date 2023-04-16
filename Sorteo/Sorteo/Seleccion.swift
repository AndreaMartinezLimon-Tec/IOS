import Foundation

class Seleccion {
    init(){
        concacaf = false
        africano = false
        restofworld = false
        europeo = 0
        conmebol = false
    }
    private var concacaf : Bool
    private var africano : Bool
    private var restofworld : Bool
    private var europeo : Int
    private var conmebol : Bool
    
    var grupoConcacaf : Set = ["México", "EE.UU", "Canadá", "Costa Rica"]
    var grupoAfricano : Set = ["Egipto","Camerún", "Ghana", "Marruecos","Túnez"]
    var grupoRestofworld : Set = ["Arabia Saudita", "Australia","Japón","Corea del sur"]
    var grupoConmebol : Set = [ "Brasil","Argentina","Ecuador", "Uruguay"]
    var grupoEuropeo : Set = ["Qatar", "Bélgica", "Francia", "Inglaterra", "España", "Portugal", "Dinamarca", "Paises Bajos", "Alemania", "Suiza", "Croacia", "Irán","Serbia","Polonia","Senegal","Gales"]
    
    func verificarEquipo(equipoPrincipal : String){
        if grupoConcacaf.contains(equipoPrincipal){
            concacaf = true
        }
        if grupoAfricano.contains(equipoPrincipal){
            africano = true
        }
        if grupoRestofworld.contains(equipoPrincipal){
            restofworld = true
        }
        if grupoEuropeo.contains(equipoPrincipal){
            europeo += 1
        }
        if grupoConmebol.contains(equipoPrincipal){
            conmebol = true
        }
    }
    
    func SortearEquipos(bombo : [String]) -> String{
        var equipos = Set(bombo)
        if concacaf{
            equipos.subtract(grupoConcacaf)
        }
        if africano {
            equipos.subtract(grupoAfricano)
        }
        if restofworld{
            equipos.subtract(grupoRestofworld)
        }
        if europeo >= 2{
            equipos.subtract(grupoEuropeo)
        }
        if conmebol{
            equipos.subtract(grupoConmebol)
        }
        
        let aleatorio = Int.random(in: 0..<equipos.count)
        let nuevoArray = Array(equipos)
        verificarEquipo(equipoPrincipal: nuevoArray[aleatorio])
        return nuevoArray[aleatorio]
    }
}
