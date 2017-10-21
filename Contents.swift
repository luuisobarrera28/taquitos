//: Playground - noun: a place where people can play

import UIKit

class Producto{

    //Propiedades
    var nombre:String
    var precio:Double
    //Inicializadores
    init(nombre:String, precio:Double){
        self.nombre = nombre
        self.precio = precio
    }
}

class Taco:Producto{
    //Propiedades
    enum TipoTaco{
        case Maciza, Suadero, Cecina, Campechano, Tripa, Pastor
    }
    var taco:TipoTaco
    //Inicializadores
    init(taquito:TipoTaco, precio:Double){
        self.taco = taquito
        let nombreTaco = String(describing: self.taco)
        super.init(nombre:nombreTaco, precio:precio)
    }
}
class Bebida:Producto{
    //Propiedades
    enum TipoBebida {
        case Coca, Vicky, Corona, AguaHorchata, AguaJamaica, Sprite
    }
    var bebida:TipoBebida
    //Inicializadores
    init(trago: TipoBebida, precio: Double){
        self.bebida = trago
        let nombreBebida = String(describing: self.bebida)
        super.init(nombre:nombreBebida, precio:precio)
    }
}

class Taqueria{
    //Metodos
    func despachar(cliente: Cliente, cantidad:Int, producto:Producto){
        cliente.agregar(producto: producto, cantidad:cantidad)
    }
    
    func cobrar(cliente: Cliente){
    var Total: Double = 0.0
        print("Comiste:")
        for cobrar in cliente.productos{
            //print(cobrar.cantidad ,cobrar.producto.nombre, cobrar.producto.precio)
            print("\(cobrar.cantidad) \(cobrar.producto.nombre) $\(cobrar.producto.precio) c/u")
            Total = (Double(cobrar.cantidad) * cobrar.producto.precio) + Total
        }
        print("El total de la cuenta es $\(Total)")
    }
}

class Cliente{
    //Propiedades
    var productos:[(producto:Producto,cantidad:Int)] = []
    //Metodos
    func agregar(producto:Producto, cantidad:Int){
        let tupla = (producto, cantidad)
        productos.append(tupla)
    }
    
   /* func comio(){
        for producto in self.productos{
            print(producto.producto.nombre, producto.cantidad)
        }
    } */
}
//Declaración de objetos (Tacos)
let maciza = Taco(taquito: .Maciza, precio: 15.0)
let suadero = Taco(taquito: .Suadero, precio: 15.0)
let pastor = Taco(taquito: .Pastor, precio: 15.0)
let cecina = Taco(taquito: .Cecina, precio: 20.0)
let tripa = Taco(taquito: .Tripa, precio: 10.0)
let campechano = Taco(taquito: .Campechano, precio: 15.0)
//Declaración de objetos (Bebidas)
let vicky = Bebida(trago: .Vicky, precio: 25.0)
let corona = Bebida(trago: .Corona, precio: 25.00)
let coca = Bebida(trago: .Coca, precio: 15.00)
let sprite = Bebida(trago: .Sprite, precio: 15.00)
let aguahorchata = Bebida(trago: .AguaHorchata, precio: 18.00)
let aguajamaica = Bebida(trago: .AguaJamaica, precio: 18.00)




let german = Cliente()
let taqueria = Taqueria()

taqueria.despachar(cliente: german, cantidad: 6, producto: pastor)
taqueria.despachar(cliente: german, cantidad: 2, producto: suadero)

taqueria.despachar(cliente: german, cantidad: 1, producto: corona)

taqueria.despachar(cliente: german, cantidad: 2, producto: maciza)

//german.comio()

taqueria.cobrar(cliente: german)

