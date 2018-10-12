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
		return vagones.count {vagon => self.vagonLiviano(vagon)}
	}

	method velocidadMaximaLocomotora() = 
		locomotoras.min{ locomotora => locomotora.velocidad() }.velocidad()
	
	method velocidadMaximaLegal()
	
	method velocidadMaxima() {
		return self.velocidadMaximaLocomotora().min(self.velocidadMaximaLegal())
	}
	
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
	
	override method velocidadMaximaLegal() = 60
	
}
class FormacionLargaDistancia inherits Formacion {
	var property origen = null
	var property destino = null
	
	method bienArmada() = self.puedeMoverse() &&  self.cumpleConBaniosNecesarios()
	
	method cumpleConBaniosNecesarios() = self.baniosDisponibles() >= self.baniosNecesarios()
	
	//Si no hay vagones de pasajeros devuelve CERO y si existen vagones de carga no influye porque no tienen baños
	method baniosDisponibles() = vagonesPasajeros.sum { vagon => vagon.cantBanios() }
	
	method baniosNecesarios() = self.limitePasajeros() / 50
	
	override method velocidadMaximaLegal() = if( origen.esGrande() and destino.esGrande() ) 200 else 150

}

class FormacionAltaVelocidad inherits FormacionLargaDistancia {
	
	method velocidadPermitida() = self.velocidadMaxima() >= 250
	
	override  method velocidadMaximaLegal() = 400 
	
	method vagonesSonLivianos() = vagones.all { vagon => self.vagonLiviano(vagon) }
	
	override method bienArmada() {
		return self.velocidadPermitida() and self.vagonesSonLivianos() and super()
	 }
	
	
}