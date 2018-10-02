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
	
	method necesitoConductorExperimentado() = formaciones.any { formacion => formacion.esCompleja() }
	
	method formacionesPuedenMoverse() {
		formaciones.all { formacion => formacion.puedenMoverse() }
	}
	
	method agregarLocomotorasParaMoverFormacion() {
		locomotoras.forEach { 
		locomotora =>
			formaciones.forEach { 
			formacion =>  if ( locomotora.arrastreUtil() >=  formacion.empujeParaMoverse() ) 
						  formacion.agregarLocomotora(locomotora)	
			}
		}
	}
	
}
