(define (domain domain-ascensor)
    (:requirements :strips :typing :fluents)
    (:types
        planta ascensor pasajero - object
        rapido lento - ascensor
    )

    (:functions
        (plazas_libres ?a - ascensor)
        (distancia ?planta_acutal - planta ?planta_destino - planta)
        (energia_total)
    )

    (:predicates
        (en_planta ?x -
            (either pasajero ascensor) ?p - planta)
        (en_ascensor ?p - pasajero ?a - ascensor)
        (puede_ir_a ?a - ascensor ?p - planta)

    )

    (:durative-action MoverAscensorLento
        :parameters (?a - lento ?p_origen - planta ?p_destino - planta)
        :duration (= ?duration
            (+4
                (* 8
                    (+ (distancia ?p_origen ?p_destino) (distancia ?p_destino ?p_origen)))))
        :condition (and
            (at start (puede_ir_a ?a ?p_destino))
            (at start (not (= ?p_origen ?p_destino)))
            (at start (en_planta ?a ?p_origen))
        )
        :effect (and
            (at end (en_planta ?a ?p_destino))
            (at start (not (en_planta ?a ?p_origen)))
            (at end (increase
                    (energia_total)
                    (/ 50 (+4
                            (* 8
                                (+ (distancia ?p_origen ?p_destino) (distancia ?p_destino ?p_origen)))
                        ))))
        )
    )
    (:durative-action MoverAscensorRapido
        :parameters (?a - rapido ?p_origen - planta ?p_destino - planta)
        :duration (= ?duration
            (+
                (/
                    (+ 17
                        ( * 1
                            ( /
                                (-
                                    (distancia ?p_origen ?p_destino)
                                    (distancia ?p_destino ?p_origen))
                                (+
                                    (distancia ?p_origen ?p_destino)
                                    (distancia ?p_destino ?p_origen)
                                )
                            )
                        )
                    ) 2
                )
                (+
                    (distancia ?p_origen ?p_destino)
                    (distancia ?p_destino ?p_origen)
                )
            )
        )
        :condition (and
            (at start (puede_ir_a ?a ?p_destino))
            (at start (not (= ?p_origen ?p_destino)))
            (at start (en_planta ?a ?p_origen))
        )
        :effect (and
            (at end (en_planta ?a ?p_destino))
            (at start (not (en_planta ?a ?p_origen)))
            (at end (increase
                    (energia_total)
                    (/ 50 (+
                            (/
                                (+ 17
                                    ( * 1
                                        ( /
                                            (-
                                                (distancia ?p_origen ?p_destino)
                                                (distancia ?p_destino ?p_origen))
                                            (+
                                                (distancia ?p_origen ?p_destino)
                                                (distancia ?p_destino ?p_origen)
                                            )
                                        )
                                    )
                                ) 2
                            )
                            (+
                                (distancia ?p_origen ?p_destino)
                                (distancia ?p_destino ?p_origen)
                            )
                        ))))

        )
    )

    (:durative-action SubirPasajero
        :parameters (?p - pasajero ?a - ascensor ?planta_actual - planta)
        :duration (= ?duration 2)
        :condition (and
            (at start (en_planta ?p ?planta_actual))
            (at start (en_planta ?a ?planta_actual))
            (at start (> (plazas_libres ?a) 0))
        )
        :effect (and
            (at end (en_ascensor ?p ?a))
            (at start (not (en_planta ?p ?planta_actual)))
            (at start (decrease (plazas_libres ?a) 1))
        )
    )
    (:durative-action BajarPasajero
        :parameters (?p - pasajero ?a - ascensor ?p_destino - planta)
        :duration (= ?duration 2) 
        :condition (and
            (at start (en_ascensor ?p ?a))
            (at start (en_planta ?a ?p_destino))
        )
        :effect (and
            (at end(en_planta ?p ?p_destino))
            (at start(not (en_ascensor ?p ?a)))
            (at end(increase (plazas_libres ?a) 1))
        )
    )
)