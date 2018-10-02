import formacion.*
import locomotoras.*
import vagones.*

class Deposito {
	var property formaciones = []
	var property locomotoras = []
	method agregarFormacion(formacion) { formaciones.add(formacion) }
	method agregarLocomotoraSuelta(locomotora) { locomotoras.add(locomotora) }
	
	method vagonesMasPesadosXformacion() {
		return formaciones.map { formacion => formacion.vagonMasPesado() }
	}
	
	method necesitoConductorExperimentado() {
		return formaciones.any { formacion => formacion.esCompleja() }	 
	}
	
	method formacionesPuedenMoverse() {
		return formaciones.all { formacion => formacion.puedeMoverse() }
	}
	
	method formacionesQueNoPuedenMoverse() {
		return formaciones.filter { formacion => !formacion.puedeMoverse()}
	}
	
	method agregarLocomotorasParaMoverFormacion() {
		locomotoras.forEach { 
		locomotora =>
			formaciones.forEach { 
			formacion =>  if ( !formacion.puedeMoverse() ) { //Valida que la formacion no pueda moverse es decir: empuje > 0
						  	if ( locomotora.arrastreUtil() >=  formacion.empujeParaMoverse() )
						 	 	formacion.agregarLocomotora(locomotora)
						  }
			}
		}
	}
}
