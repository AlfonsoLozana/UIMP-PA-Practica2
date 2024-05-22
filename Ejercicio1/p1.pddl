(define (problem ascensor-problema-1)
    (:domain domain-ascensor)
    (:objects
        ascensor-rapido - rapido
        ascensor-lento-b1 ascensor-lento-b2-1 
        ascensor-lento-b2-2 ascensor-lento-b3 - lento
        pasajero0 pasajero1 pasajero2 pasajero3 pasajero4 - pasajero
        planta0 planta1 planta2 planta3 planta4 planta5 
        planta6 planta7 planta8 planta9 planta10 planta11 planta12 - planta
        capacidad0 capacidad1 capacidad2 capacidad3 - capacidad
    )
    (:init
        ; Posiciones iniciales de ascensores
        (en_planta ascensor-rapido planta0)
        (en_planta ascensor-lento-b1 planta0)
        (en_planta ascensor-lento-b2-1 planta4)
        (en_planta ascensor-lento-b2-2 planta4)
        (en_planta ascensor-lento-b3 planta8)

        ; Posiciones iniciales de los pasajeros
        (en_planta pasajero0 planta2)
        (en_planta pasajero1 planta4)
        (en_planta pasajero2 planta1)
        (en_planta pasajero3 planta8)
        (en_planta pasajero4 planta1)

        ; Capacidad de los ascensores
        (capacidad_ascensor ascensor-rapido capacidad3)
        (capacidad_ascensor ascensor-lento-b1 capacidad2)
        (capacidad_ascensor ascensor-lento-b2-1 capacidad2)
        (capacidad_ascensor ascensor-lento-b2-2 capacidad2)
        (capacidad_ascensor ascensor-lento-b3 capacidad2)

        ; Orden de las capacidades
        (predecesor_capacidad capacidad0 capacidad1)
        (predecesor_capacidad capacidad1 capacidad2)
        (predecesor_capacidad capacidad2 capacidad3)

        ; Plantas accesibles desde cada ascensor
        (puede_ir_a ascensor-rapido planta0)
        (puede_ir_a ascensor-rapido planta2)
        (puede_ir_a ascensor-rapido planta4)
        (puede_ir_a ascensor-rapido planta6)
        (puede_ir_a ascensor-rapido planta8)
        (puede_ir_a ascensor-rapido planta10)
        (puede_ir_a ascensor-rapido planta12)

        (puede_ir_a ascensor-lento-b1 planta0)
        (puede_ir_a ascensor-lento-b1 planta1)
        (puede_ir_a ascensor-lento-b1 planta2)
        (puede_ir_a ascensor-lento-b1 planta3)
        (puede_ir_a ascensor-lento-b1 planta4)

        (puede_ir_a ascensor-lento-b2-1 planta4)
        (puede_ir_a ascensor-lento-b2-1 planta5)
        (puede_ir_a ascensor-lento-b2-1 planta6)
        (puede_ir_a ascensor-lento-b2-1 planta7)
        (puede_ir_a ascensor-lento-b2-1 planta8)

        (puede_ir_a ascensor-lento-b2-2 planta4)
        (puede_ir_a ascensor-lento-b2-2 planta5)
        (puede_ir_a ascensor-lento-b2-2 planta6)
        (puede_ir_a ascensor-lento-b2-2 planta7)
        (puede_ir_a ascensor-lento-b2-2 planta8)

        (puede_ir_a ascensor-lento-b3 planta8)
        (puede_ir_a ascensor-lento-b3 planta9)
        (puede_ir_a ascensor-lento-b3 planta10)
        (puede_ir_a ascensor-lento-b3 planta11)
        (puede_ir_a ascensor-lento-b3 planta12)
    )
    (:goal
        (and
            ; Objetivos de los pasajeros
            (en_planta pasajero0 planta3)
            (en_planta pasajero1 planta11)
            (en_planta pasajero2 planta12)
            (en_planta pasajero3 planta1)
            (en_planta pasajero4 planta9)
        )
    )
)