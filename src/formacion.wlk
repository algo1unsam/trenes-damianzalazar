import depositos.*
import locomotoras.*
import vagones.*

class Formacion {
	var property locomotoras = []
	var property vagones = []
	var property vagonesCarga = []
	var property vagonesPasajeros = []
	
	method agregarLocomotora(locomotora) { locomotoras.add(locomotora) }
	method agregarVagonCarga(vagon) { 
		vagonesCarga.add(vagon) 
		vagones.add(vagon)
	}
	method agregarVagonPasajeros(vagon) { 
		vagonesPasajeros.add(vagon) 
		vagones.add(vagon)
	}
	
	method limitePasajeros() {
		return vagonesPasajeros.sum { vagon => vagon.cantPasajeros()}
	}
	
	method vagonLiviano(vagon) = vagon.peso() < 2500

	method cantVagonesLivianos() {
		return vagones.filter {vagon => self.vagonLiviano(vagon) }.size()	   
	}

	method velocidadMaxima() = 
		locomotoras.min{ locomotora => locomotora.velocidad() }.velocidad()
	
	method eficiente() = 
		locomotoras.all { locomotora => locomotora.arrastre() >= locomotora.peso() * 5 }
	
	method puedeMoverse() =
		locomotoras.sum { locomotora => locomotora.arrastreUtil() } >=
		vagones.sum { vagon => vagon.peso() }

	method empujeParaMoverse(){
		if (self.puedeMoverse()) 0
		return vagones.sum { vagon => vagon.peso() } -
			   locomotoras.sum { locomotora => locomotora.arrastreUtil() }
	}

	method vagonMasPesado() {
		return vagones.max { vagon => vagon.peso() }
	}
	
	method cantVagonesYlocomotoras() = locomotoras.size() + vagones.size()
	
	method pesoVagonesYlocomotoras() { 
		return locomotoras.sum { locomotora => locomotora.peso() } + 
			   vagones.sum { vagon => vagon.peso() }
	}
	
	method esCompleja() = self.cantVagonesYlocomotoras() > 20 || self.pesoVagonesYlocomotoras() > 10000
}

class FormacionCortaDistancia inherits Formacion {
	method bienArmada(formacion) = self.puedeMoverse() && !self.esCompleja()
	
}
class FormacionLargaDistancia inherits Formacion {
	method bienArmada() = self.puedeMoverse() &&  self.cumpleConBaniosNecesarios()
	
	method cumpleConBaniosNecesarios() = self.baniosDisponibles() >= self.baniosNecesarios()
	
	method baniosDisponibles() = vagonesPasajeros.sum { vagon => vagon.cantBanios() }
	
	method baniosNecesarios() = self.limitePasajeros() / 50	
	
}