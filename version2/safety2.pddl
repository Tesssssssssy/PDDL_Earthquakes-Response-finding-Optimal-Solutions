;Header and description
(define (domain safety2)

    ;remove requirements that are not needed
    (:requirements :strips :fluents :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality)

    ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    (:types 
        emergency_patient
        school hospital firestation
        ambulance
        bed
    )

    ;todo: define numeric functions here
    (:functions 
        (fuel-amount ?ambulance - ambulance)
        (time ?ambulance - ambulance) 
        (distance1 ?firestation - firestation ?school - school)
        (distance2 ?school - school ?hospital - hospital)
        (distance3 ?hospital - hospital ?firestation - firestation)
    )
    
    ;todo: define predicates here
    (:predicates 
        (in ?emergency_patient - emergency_patient ?school-or-ambulance-or-hospital-or-bed - (either school ambulance hospital bed))
        (enough ?bed ?hospital)
        (at ?ambulance - ambulance ?school-or-firestation-or-hospital - (either school firestation hospital))
        (empty ?ambulance - (either ambulance))
    )

    ;define actions here
    (:action ambulance_goes_to_school
        :parameters 
            (
                ?ambulance - ambulance
                ?school - school
                ?firestation - firestation
            )
        :precondition 
            (and
                (at ?ambulance ?firestation)
                (not (at ?ambulance ?school))
                (empty ?ambulance)
                (> (fuel-amount ?ambulance) 10)
            )
        :effect 
            (and (at ?ambulance ?school)
                 (not (at ?ambulance ?firestation))
                 (decrease (fuel-amount ?ambulance) (* (distance1 ?firestation ?school) 3))
                 (increase (time ?ambulance) (* (distance1 ?firestation ?school) 10))
            )
    )

    (:action patient_load_ambulance
      :parameters 
                (
                  ?emergency_patient - emergency_patient
                  ?school - school
                  ?ambulance - ambulance
                )
      :precondition 
                (and (in ?emergency_patient ?school)
                     (empty ?ambulance)
                     (at ?ambulance ?school)
                )
      :effect 
            (and (not (in ?emergency_patient ?school))
                 (in ?emergency_patient ?ambulance)
                 (not (empty ?ambulance))
                 (increase (time ?ambulance) 5)
            )
    )

    (:action move_ambulance_to_hospital
      :parameters 
                (
                  ?ambulance - ambulance
                  ?school - school
                  ?hospital - hospital
                  ?emergency_patient - emergency_patient
                )
      :precondition 
                (and (at ?ambulance ?school)
                     (not (empty ?ambulance))
                     (in ?emergency_patient ?ambulance)
                     (not (in ?emergency_patient ?school))
                     (> (fuel-amount ?ambulance) 10)
                )
      :effect 
            (and (not (at ?ambulance ?school))
                 (at ?ambulance ?hospital)
                 (decrease (fuel-amount ?ambulance) (* (distance2 ?school ?hospital) 3))
                 (increase (time ?ambulance) (* (distance2 ?school ?hospital) 10))

            )
    )
    
    (:action patient_unload_ambulance
      :parameters 
                (
                  ?emergency_patient - emergency_patient
                  ?ambulance - ambulance
                  ?hospital - hospital
                  ?school - school
                )
      :precondition 
                (and (in ?emergency_patient ?ambulance)
                     (at ?ambulance ?hospital)
                     (not (at ?ambulance ?school))
                     (not (empty ?ambulance))
                )
      :effect 
            (and (not (in ?emergency_patient ?ambulance))
                 (in ?emergency_patient ?hospital)
                 (empty ?ambulance)
                 (increase (time ?ambulance) 5)
            )
    )

    (:action patient_go_to_bed
      :parameters 
                (
                  ?emergency_patient - emergency_patient
                  ?bed - bed
                  ?hospital - hospital
                )
      :precondition 
                (and (in ?emergency_patient ?hospital)
                     (not (in ?emergency_patient ?bed))
                     (enough ?bed ?hospital)
                )
      :effect 
            (and (not (enough ?bed ?hospital))
                 (in ?emergency_patient ?bed)
            )
    )

    (:action move_back_ambulance_to_school
      :parameters 
                (
                  ?emergency_patient - emergency_patient
                  ?hospital - hospital
                  ?ambulance - ambulance
                  ?school - school
                  ?bed - bed
                )
      :precondition 
                (and (not (in ?emergency_patient ?ambulance))
                     (in ?emergency_patient ?bed)
                     (at ?ambulance ?hospital)
                     (not (at ?ambulance ?school))
                     (empty ?ambulance)
                     (> (fuel-amount ?ambulance) 10)
                )
      :effect 
            (and (at ?ambulance ?school)
                 (not (at ?ambulance ?hospital)) 
                 (decrease (fuel-amount ?ambulance) (* (distance2 ?school ?hospital) 3))
                 (increase (time ?ambulance) (* (distance2 ?school ?hospital) 10))             
            )
    )

    (:action come_home_ambulance
        :parameters 
                    (
                        ?ambulance - ambulance
                        ?firestation - firestation
                        ?hospital - hospital
                        ?school - school
                        ?emergency_patient - emergency_patient
                    )
        :precondition 
                    (and (at ?ambulance ?hospital)
                         (not (at ?ambulance ?school))
                         (not (at ?ambulance ?firestation))
                         (empty ?ambulance)
                         (not (in ?emergency_patient ?school))
                         (> (fuel-amount ?ambulance) 10)
                    )
        :effect 
                (and (at ?ambulance ?firestation)
                     (not (at ?ambulance ?hospital))
                     (decrease (fuel-amount ?ambulance) (* (distance3 ?hospital ?firestation) 3))
                )
    )

    (:action recharge
        :parameters 
                    (
                        ?ambulance - ambulance
                        ?firestation - firestation
                    )
        :precondition 
                    (and (at ?ambulance ?firestation)
                         (empty ?ambulance)
                         (<= (fuel-amount ?ambulance) 50)
                    )
        :effect 
            (and (increase (fuel-amount ?ambulance) 50))
    )
    

)