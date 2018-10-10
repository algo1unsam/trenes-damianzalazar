import depositos.*
import formacion.*
import vagones.*

class Locomotora{
	var property velocidad = 80
	method peso() = 1000
	method arrastre() = 12000
	method arrastreUtil() = self.arrastre() - self.peso()
	
}

class Ciudad {
	var property esGrande = false
}