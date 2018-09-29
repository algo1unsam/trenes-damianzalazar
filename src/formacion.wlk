import vagones.*

class Formacion {
	var property locomotoras = []
	var property vagones = []
	
	method agregarLocomotora(locomotora) { locomotoras.add(locomotora) }
	method agregarVagon(vagon) = { vagones.add(vagon) }
	method vagonLiviano(vagon) = vagon.peso() < 2500
	method cantVagonesLivianos() {
		return vagones.filter{vagon => self.vagonLiviano(vagon) }.size() 
	}
	
}

object locomotora1{
	method peso() = 1000
	method puedeArrastrar() = 12000 // ARRASTRE UTIL = puedeArrastrar - peso = 11000
	method velocidad() = 80
	
}

object locomotora2{
		
}