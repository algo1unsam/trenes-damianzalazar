import formacion.*
import locomotoras.*
import vagones.*

class Deposito {
	var property formaciones = []
	var property vagonesPesados = []
	
	method agregarFormacion(formacion) { formaciones.add(formacion)}
//	method vagonesMasPesados() { 
//		vagonesPesados =  formaciones.filter { formacion => formacion.vagonMasPesado() }
//	}
	
}
