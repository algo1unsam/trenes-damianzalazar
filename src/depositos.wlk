import formacion.*
import locomotoras.*
import vagones.*

class Deposito {
	var property formaciones = []
	var property vagonesMasPesadosXformacion = []
	
	method agregarFormacion(formacion) { formaciones.add(formacion)}

	method vagonMasPesadoXformacion() { 
		formaciones.forEach { formacion => vagonesMasPesadosXformacion = formacion.vagonMasPesado() }
	}	
	
	method cantVagonesMasPesadosXformacion(){
		return vagonesMasPesadosXformacion.size()
	}
}
