
import UIKit
import Foundation

struct Point{
    // (x, y)
    let x: Double
    let y: Double
    
    // metodo para calculo de distancia entre dois pontos
    func distance(from point: Point) -> Double {
        return 0.0
    }
}

struct Triangule{
    //(vertex1, vertex2, vertex3 stored properties
    // kind -> Enumerador (equilateral, isoceles, scalene)
    enum Kind{
        case equilatero
        case isosceles
        case scalene
    }
    
    let vertex1: Point
    let vertex2: Point
    let vertex3: Point
    
    var kind: Kind{
        //calcula a distancia entre AB, AC e BC
        //compara o tamanho dos lados
        //retorna o tipo  .equilatero .isosceles .escaleno
        let AB : Double = sqrt(pow((vertex1.x - vertex2.x), 2) + pow((vertex1.y - vertex2.y),2)).roundTo(places: 2)
        let AC : Double = sqrt(pow((vertex1.x - vertex3.x), 2) + pow((vertex1.y - vertex3.y),2)).roundTo(places: 2)
        let BC = sqrt(pow((vertex2.x - vertex3.x), 2) + pow((vertex2.y - vertex3.y),2)).roundTo(places: 2)
        
        if(AB == AC && AC == BC && AB == BC){
            return .equilatero
        }else if(AB != AC && AC != BC && AB != BC) {
            return .scalene
        }else{
            return .isosceles
        }
        
    }
}

extension Double{
    func roundTo(places: Int) -> Double{
        let divisor = pow(10.0, Double (places))
        return (self * divisor).rounded() / divisor
    }
}

pow(10, 2)
sqrt(25)
abs(-10)

var a = Triangule(vertex1: Point(x: 2, y: 7), vertex2: Point(x: 2, y: 3), vertex3: Point(x: 5, y: 3)).kind
var b = Triangule(vertex1: Point(x: 2, y: 3), vertex2: Point(x: 2, y: 1), vertex3: Point(x: 4, y: 1)).kind
var c = Triangule(vertex1: Point(x: 5, y: 7), vertex2: Point(x: 10, y: 9), vertex3: Point(x: 5.768, y: 12.33)).kind
print(a)
print(b)
print(c)

//A(2,7) B(2, 3) C(5, 3)  //escaleno
//A(2, 3) B(2, 1) C(4, 1) //isoceles
//A(5, 7) B(10, 9) C(5.768, 12,33) //equilatero
