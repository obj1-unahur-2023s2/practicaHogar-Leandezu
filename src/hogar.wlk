class Habitacion{
	var ocupantes = []
	
	method confort(unaPersona) = 10
	method puedeIngresar(unaPersona)
}

class UsoGeneral inherits Habitacion{
}

class Banio inherits Habitacion{
	method edadDeOcupante(persona) = persona.edad()
	override method confort(unaPersona){
		
		return super(unaPersona) + if(self.edadDeOcupante(unaPersona) <= 4){2}else{4}
	}
	
}

class Dormitorio inherits Habitacion{
	var duermen = []
	method ingresarADormir(unaPersona) = duermen.add(unaPersona)
	method ingresarAEstar(unaPersona) = ocupantes.add(unaPersona)
	method duermen() = duermen
	method cantidadQueDuermen() = duermen.size()
	override method confort(persona){
		return super(persona) + if(persona.duermeEn(self)){10 / self.cantidadQueDuermen()}else{0}	
	}
}

class Cocina inherits Habitacion{
	var metros
	
	method sabeCocinar(persona) = persona.sabeCocinar()
	method calculoConfort() = (metros  * (metroCuadrado.porcentaje()) / 100)
	override method confort(persona){
		return super(persona) + if(persona.sabeCocinar()){self.calculoConfort()} else{0}
	}
	
}

object metroCuadrado{
	var property porcentaje = 10
}

class Persona{
	var edad
	var property sabeCocinar
	var puntosDeConfort
	
	method edad() = edad
	method aprenderACocinar() = self.sabeCocinar(true)
	method duermeEn(unaHabitacion){
		return unaHabitacion.duermen().contains(self)
	}
	
}

