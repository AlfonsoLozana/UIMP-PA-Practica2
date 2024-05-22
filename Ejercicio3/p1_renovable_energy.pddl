(define (problem ascensor-problema-1)
    (:domain domain-ascensor-renovable)
    (:objects
        ascensor-rapido - rapido
        recargando activo - estado
        ascensor-lento-b1 ascensor-lento-b2-1 ascensor-lento-b2-2 ascensor-lento-b3 - lento
        pasajero0 pasajero1 pasajero2 pasajero3 pasajero4 - pasajero
        planta0 planta1 planta2 planta3 planta4 planta5 planta6 planta7 planta8 planta9 planta10 planta11 planta12 - planta
    )
    (:init
        ;Inicializamos variables
        (= (energia_total) 0)
        (= (capacidad) 20)
        (= (velocidad_recarga) 1)
        (= (energia_disponible) 0)

        ; Distancia desde planta0
        (=(distancia planta0 planta1) 1)
        (=(distancia planta0 planta2) 2)
        (=(distancia planta0 planta3) 3)
        (=(distancia planta0 planta4) 4)
        (=(distancia planta0 planta5) 5)
        (=(distancia planta0 planta6) 6)
        (=(distancia planta0 planta7) 7)
        (=(distancia planta0 planta8) 8)
        (=(distancia planta0 planta9) 9)
        (=(distancia planta0 planta10) 10)
        (=(distancia planta0 planta11) 11)
        (=(distancia planta0 planta12) 12)
        ; Distancia desde planta1
        (=(distancia planta1 planta2) 1)
        (=(distancia planta1 planta3) 2)
        (=(distancia planta1 planta4) 3)
        (=(distancia planta1 planta5) 4)
        (=(distancia planta1 planta6) 5)
        (=(distancia planta1 planta7) 6)
        (=(distancia planta1 planta8) 7)
        (=(distancia planta1 planta9) 8)
        (=(distancia planta1 planta10) 9)
        (=(distancia planta1 planta11) 10)
        (=(distancia planta1 planta12) 11)
        ; Distancias desde planta2
        (=(distancia planta2 planta3) 1)
        (=(distancia planta2 planta4) 2)
        (=(distancia planta2 planta5) 3)
        (=(distancia planta2 planta6) 4)
        (=(distancia planta2 planta7) 5)
        (=(distancia planta2 planta8) 6)
        (=(distancia planta2 planta9) 7)
        (=(distancia planta2 planta10) 8)
        (=(distancia planta2 planta11) 9)
        (=(distancia planta2 planta12) 10)
        ; Distancias desde planta3
        (=(distancia planta3 planta4) 1)
        (=(distancia planta3 planta5) 2)
        (=(distancia planta3 planta6) 3)
        (=(distancia planta3 planta7) 4)
        (=(distancia planta3 planta8) 5)
        (=(distancia planta3 planta9) 6)
        (=(distancia planta3 planta10) 7)
        (=(distancia planta3 planta11) 8)
        (=(distancia planta3 planta12) 9)
        ; Distancias desde planta4
        (=(distancia planta4 planta5) 1)
        (=(distancia planta4 planta6) 2)
        (=(distancia planta4 planta7) 3)
        (=(distancia planta4 planta8) 4)
        (=(distancia planta4 planta9) 5)
        (=(distancia planta4 planta10) 6)
        (=(distancia planta4 planta11) 7)
        (=(distancia planta4 planta12) 8)
        ; Distancias desde planta5
        (=(distancia planta5 planta6) 1)
        (=(distancia planta5 planta7) 2)
        (=(distancia planta5 planta8) 3)
        (=(distancia planta5 planta9) 4)
        (=(distancia planta5 planta10) 5)
        (=(distancia planta5 planta11) 6)
        (=(distancia planta5 planta12) 7)
        ; Distancias desde planta6
        (=(distancia planta6 planta7) 1)
        (=(distancia planta6 planta8) 2)
        (=(distancia planta6 planta9) 3)
        (=(distancia planta6 planta10) 4)
        (=(distancia planta6 planta11) 5)
        (=(distancia planta6 planta12) 6)
        ; Distancias desde planta7
        (=(distancia planta7 planta8) 1)
        (=(distancia planta7 planta9) 2)
        (=(distancia planta7 planta10) 3)
        (=(distancia planta7 planta11) 4)
        (=(distancia planta7 planta12) 5)
        ; Distancias desde planta8)
        (=(distancia planta8 planta9) 1)
        (=(distancia planta8 planta10) 2)
        (=(distancia planta8 planta11) 3)
        (=(distancia planta8 planta12) 4)
        ; Distancias desde planta9)
        (=(distancia planta9 planta10) 1)
        (=(distancia planta9 planta11) 2)
        (=(distancia planta9 planta12) 3)
        ; Distancias desde planta10
        (=(distancia planta10 planta11) 1)
        (=(distancia planta10 planta12) 2)
        ; Distancias desde planta11
        (=(distancia planta11 planta12) 1)


        ;estado de los ascensores;
        (estado activo)

        ; Configuración de bloques y ascensores
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

        ; Capacidades de los ascensores
        (= (plazas_libres ascensor-rapido) 3)
        (= (plazas_libres ascensor-lento-b1) 2)
        (= (plazas_libres ascensor-lento-b2-1) 2)
        (= (plazas_libres ascensor-lento-b2-2) 2)
        (= (plazas_libres ascensor-lento-b3) 2)

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
            ;Objetivos de los pasajeros
            (en_planta pasajero0 planta0)
            (en_planta pasajero1 planta11)
            (en_planta pasajero2 planta12)
            (en_planta pasajero3 planta1)
            (en_planta pasajero4 planta9)
        )
    )

    (:metric minimize
        (energia_total)
    )
)