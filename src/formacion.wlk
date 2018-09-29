import locomotoras.*
import vagones.*

class Formacion {
	var property locomotoras = []
	var property vagonesCarga = []
	var property vagonesPasajeros = []
	
	method agregarLocomotora(locomotora) { locomotoras.add(locomotora) }
	method agregarVagonCarga(vagon) { vagonesCarga.add(vagon) }
	method agregarVagonPasajeros(vagon) { vagonesPasajeros.add(vagon) }
	
	method limitePasajeros() {
		return vagonesPasajeros.sum { vagon => vagon.cantPasajeros()}
	}
	
	method vagonLiviano(vagon) = vagon.peso() < 2500
	method cantVagonesLivianos() {
		return vagonesCarga.filter {vagon => self.vagonLiviano(vagon) }.size() + 
			   vagonesPasajeros.filter {vagon => self.vagonLiviano(vagon) }.size()
	}

	method velocidadMaxima() = 
		locomotoras.min{ locomotora => locomotora.velocidad() }.velocidad()
	
	method eficiente() = 
		locomotoras.all { locomotora => locomotora.arrastre() >= locomotora.peso() * 5 }
	
	method puedeMoverse() =
		locomotoras.sum { locomotora => locomotora.arrastreUtil() } >=
		vagonesCarga.sum { vagon => vagon.peso() } + 
		vagonesPasajeros.sum { vagon => vagon.peso() }	
		
	method empujeParaMoverse(){
		if (self.puedeMoverse()) 0
		return vagonesCarga.sum { vagon => vagon.peso() } + 
			   vagonesPasajeros.sum { vagon => vagon.peso() } -
			   locomotoras.sum { locomotora => locomotora.arrastreUtil() }
	}

	method vagonMasPesado() {
		return 	[vagonesCarga.max { vagon => vagon.peso() },
				 vagonesPasajeros.max { vagon => vagon.peso() }].max { vagon => vagon.peso() }
	}



//crear coleccion vagones





}