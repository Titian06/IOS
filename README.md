En la act 9, las respuestas son A,B,D,E
Parte 2 act 7

func obtenerNumeroAleatorio() -> Int? {
    if Bool.random() {
        return Int.random(in: 1...100)
    } else {
        return nil
    }
}

// Llamamos a la función y obtenemos un optional Int
let numeroAleatorio = obtenerNumeroAleatorio()

// Comprobamos si la función devolvió un valor o no
if let numero = numeroAleatorio {
    print("El número aleatorio es: \(numero)")
} else {
    print("No se pudo obtener un número aleatorio.")
}
