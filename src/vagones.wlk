class VagonCarga {
	var property cargaMaxima = 1000
	method peso() = cargaMaxima + 160
}

class VagonPasajero {
	var property ancho = 2.5
	var property largo = 10
	
	method cantPasajeros() = if (ancho <= 2.5 ) largo * 8 else largo * 10
	method peso() = self.cantPasajeros() * 80
}

object vagonCarga1 {

}