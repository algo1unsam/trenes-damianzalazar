import depositos.*
import formacion.*
import vagones.*

class Locomotora{
	method peso() = 1000
	method arrastre() = 12000
	method velocidad() = 80
	method arrastreUtil() = self.arrastre() - self.peso()
}
