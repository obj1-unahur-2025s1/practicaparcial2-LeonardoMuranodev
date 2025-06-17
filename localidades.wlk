import personajes.*

class Localidad {
    const cantHabitantes
    var ejercitoDefensor

    //Metodos de consulta
    method ejercitoDefensor() = ejercitoDefensor

    method poderDefensivo() = ejercitoDefensor.poderOfensivoTotalEjercito()

    //Metodos de indicacion
    method serOcupada(unEjercito)
}


class Ejercito {
    const integrantes = []

    //Metodos de consulta
    method poderOfensivoTotalEjercito() = integrantes.sum({i => i.poderOfensivo()})
    method puedeTomarLocalidad(unaLocalidad) = self.poderOfensivoTotalEjercito() > unaLocalidad.poderDefensivo()
    method cantIntegrantes() = integrantes.size()
    method los10MasFuertes() {
        return integrantes.sortBy({i, i2 => i.poderOfensivo() > i2.poderOfensivo()}).take(10)
    }

    //Metodos de indicacion
    method invadir(unaLocalidad) {
        if(self.puedeTomarLocalidad(unaLocalidad)) {
            unaLocalidad.serOcupada(self)
        }
    }
}

class Aldea inherits Localidad{
    const cantMaxHabitantes

    override method serOcupada(unEjercito) {
        if (unEjercito.cantIntegrantes() > cantMaxHabitantes) {
            ejercitoDefensor = unEjercito.los10MasFuertes()
        } else {
            ejercitoDefensor = unEjercito
        }
    }
}

class Ciudad inherits Localidad{
    override method poderDefensivo() = super() + 300

     override method serOcupada(unEjercito) {
        ejercitoDefensor = unEjercito
     }
}
