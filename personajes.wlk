class Personaje {
    const fuerza
    const inteligencia
    var rol

    //Metodos de consulta
    method potencialOfensivo() = fuerza * 10 + rol.extra()   
    method esInteligente()   // --> metodo abstracto
    method esGrosoEnSuRol() = rol.esGroso(self)
    method esGroso() = self.esInteligente() || self.esGrosoEnSuRol()

    //Metodos de indicacion
    method cambiarRol(unRol) {
        rol = unRol
    }
}

class Mascota {
    const property fuerza
    var edad
    const property tieneGarras

    //Metodos de consulta    
    method extra() = if (tieneGarras) fuerza * 2 else fuerza
    method esLongeva() = edad > 10

    //Metodos de indicacion
    method cumplirAños() {
        edad += 1
    }
}

class Orco inherits Personaje{
    override method potencialOfensivo() = if (rol==brujo) super() * 1.1 else super()
    override method esInteligente() = false
}

class Humano inherits Personaje {
    override method esInteligente() = inteligencia > 5
}

//Roles
object guerrero {
    method extra() = 100
    method esGroso(unPersonaje) = unPersonaje.fuerza() > 50
}

class Cazador {
    const property mascota

    method extra() = mascota.extra()
    method esGroso(unPersonaje) = mascota.esLongeva()
}

object brujo {
    method extra() = 0
    method esGroso(unPersonaje) = true
}
