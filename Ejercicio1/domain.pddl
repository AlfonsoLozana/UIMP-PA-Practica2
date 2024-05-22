(define (domain domain-ascensor)
    (:requirements :strips :typing)
    (:types
        planta ascensor pasajero capacidad - object
        rapido lento - ascensor
    )

    (:predicates
        (en_planta ?x - (either pasajero ascensor) ?p - planta)
        (en_ascensor ?p - pasajero ?a - ascensor)
        (puede_ir_a ?a - ascensor ?p - planta)
        (capacidad_ascensor ?a - ascensor ?c - capacidad)
        (predecesor_capacidad ?c1 - capacidad ?c2 - capacidad)
    )

    (:action MoverAscensor
        :parameters (?a - ascensor ?p_origen - planta ?p_destino - planta)
        :precondition (and
            (puede_ir_a ?a ?p_destino)
            (not(= ?p_origen ?p_destino))
            (en_planta ?a ?p_origen)
        )
        :effect (and
            (en_planta ?a ?p_destino)
            (not (en_planta ?a ?p_origen))
        )
    )

    (:action SubirPasajero
        :parameters (?p - pasajero ?a - ascensor ?planta_actual - planta ?capacidad_actual ?final_capacidad - capacidad)
        :precondition (and
            (en_planta ?p ?planta_actual)
            (en_planta ?a ?planta_actual)
            (not(capacidad_ascensor ?a capacidad0))
            (capacidad_ascensor ?a ?capacidad_actual)
            (predecesor_capacidad ?final_capacidad ?capacidad_actual)
        )
        :effect (and
            (en_ascensor ?p ?a)
            (not (en_planta ?p ?planta_actual))
            (not(capacidad_ascensor ?a ?capacidad_actual))
            (capacidad_ascensor ?a ?final_capacidad)
        )
    )

    (:action BajarPasajero
        :parameters (?p - pasajero ?a - ascensor ?p_destino - planta ?capacidad_actual ?final_capacidad - capacidad)
        :precondition (and
            (en_ascensor ?p ?a)
            (en_planta ?a ?p_destino)
            (capacidad_ascensor ?a ?capacidad_actual)
            (predecesor_capacidad ?capacidad_actual ?final_capacidad)
        )
        :effect (and
            (en_planta ?p ?p_destino)
            (not (en_ascensor ?p ?a))
            (not(capacidad_ascensor ?a ?capacidad_actual))
            (capacidad_ascensor ?a ?final_capacidad)
        )
    )
)