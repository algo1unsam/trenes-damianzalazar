import formacion.*
import locomotoras.*
import vagones.*

class Deposito {
	var property formaciones = []
	
	method agregarFormacion(formacion) { formaciones.add(formacion)}
	
	method vagonesMasPesadosXformacion() {
		return formaciones.map { formacion => formacion.vagonMasPesado() }
	}
}
