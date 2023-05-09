(define (problem safety-pb1)
  (:domain safety)
  (:requirements :strips :typing :negative-preconditions) 

  (:objects
    ai_agent - AI_agent

    si - school_info
    cs - connection_status
    pi - patients_info
    aas - ambu_arrival_status

    school1 school2 school3 - school
    hospital1 hospital2 hospital3 - hospital
    firestation1 firestation2 firestation3 - firestation
    ambu1_1 ambu1_2 ambu1_3 ambu2_1 ambu2_2 ambu2_3 ambu2_4 ambu3_1 ambu3_2 - ambulance

    ;ambu_worker1_1 ambu_worker1_2 ambu_worker1_3 ambu_worker1_4 ambu_worker1_5 ambu_worker1_6
    ;ambu_worker2_1 ambu_worker2_2 ambu_worker2_3 ambu_worker2_4 ambu_worker2_5 ambu_worker2_6 ambu_worker2_7 ambu_worker2_8
    ;ambu_worker3_1 ambu_worker3_2 ambu_worker3_3 ambu_worker3_4 - ambulance_worker

    bed1_1 bed1_2 bed1_3 bed1_4 bed1_5 bed1_6 bed1_7 bed1_8 bed1_9 bed1_10
    bed1_11 bed1_12 bed1_13 bed1_14 bed1_15 bed1_16 bed1_17 bed1_18 bed1_19 bed1_20
    bed2_1 bed2_2 bed2_3 bed2_4 bed2_5 bed2_6 bed2_7 bed2_8 bed2_9 bed2_10
    bed2_11 bed2_12 bed2_13 bed2_14 bed2_15 bed2_16 bed2_17 bed2_18 bed2_19 bed2_20
    bed2_21 bed2_22 bed2_23 bed2_24 bed2_25 bed2_26 bed2_27 bed2_28 bed2_29 bed2_30
    bed3_1 bed3_2 bed3_3 bed3_4 bed3_5 bed3_6 bed3_7 bed3_8 bed3_9 bed3_10 - bed
    
    patient1 patient2 patient3 patient4 patient5 patient6 patient7 patient8 patient9 patient10
    patient11 patient12 patient13 patient14 patient15 patient16 patient17 patient18 patient19 patient20
    patient21 patient22 patient23 patient24 patient25 patient26 patient27 patient28 patient29 patient30
    patient31 patient32 patient33 patient34 patient35 patient36 patient37 patient38 patient39 patient40 - emergency_patient
  )

  (:init
    (have ai_agent si)
    (not (have ai_agent cs))
    (not (have ai_agent aas))
    (not (have ai_agent pi))

    ;; patient1~10 are student of school1 
    (in patient1 school1)
    (in patient2 school1)
    (in patient3 school1)
    (in patient4 school1)
    (in patient5 school1)
    (in patient6 school1)
    (in patient7 school1)
    (in patient8 school1)
    (in patient9 school1)
    (in patient10 school1)

    ;; patient11~20 are student of school2
    (in patient11 school2)
    (in patient12 school2)
    (in patient13 school2)
    (in patient14 school2)
    (in patient15 school2)
    (in patient16 school2)
    (in patient17 school2)
    (in patient18 school2)    
    (in patient19 school2)
    (in patient20 school2)

    ;; patient21~40 are student of school3
    (in patient21 school3)
    (in patient22 school3)
    (in patient23 school3)
    (in patient24 school3)
    (in patient25 school3)
    (in patient26 school3)
    (in patient27 school3)
    (in patient28 school3)
    (in patient29 school3)
    (in patient30 school3)
    (in patient31 school3)
    (in patient32 school3)
    (in patient33 school3)
    (in patient34 school3)
    (in patient35 school3)
    (in patient36 school3)
    (in patient37 school3)
    (in patient38 school3)
    (in patient39 school3)
    (in patient40 school3)

    ;; hospital1 has 20 beds
    (enough bed1_1 hospital1)
    (enough bed1_2 hospital1)
    (enough bed1_3 hospital1)
    (enough bed1_4 hospital1)
    (enough bed1_5 hospital1)
    (enough bed1_6 hospital1)
    (enough bed1_7 hospital1)
    (enough bed1_8 hospital1)
    (enough bed1_9 hospital1)
    (enough bed1_10 hospital1)
    (enough bed1_11 hospital1)
    (enough bed1_12 hospital1)
    (enough bed1_13 hospital1)
    (enough bed1_14 hospital1)
    (enough bed1_15 hospital1)
    (enough bed1_16 hospital1)
    (enough bed1_17 hospital1)
    (enough bed1_18 hospital1)
    (enough bed1_19 hospital1)
    (enough bed1_20 hospital1)

    ;; hospital2 has 30 beds
    (enough bed2_1 hospital2)
    (enough bed2_2 hospital2)
    (enough bed2_3 hospital2)
    (enough bed2_4 hospital2)
    (enough bed2_5 hospital2)
    (enough bed2_6 hospital2)
    (enough bed2_7 hospital2)
    (enough bed2_8 hospital2)
    (enough bed2_9 hospital2)
    (enough bed2_10 hospital2)
    (enough bed2_11 hospital2)
    (enough bed2_12 hospital2)
    (enough bed2_13 hospital2)
    (enough bed2_14 hospital2)
    (enough bed2_15 hospital2)
    (enough bed2_16 hospital2)
    (enough bed2_17 hospital2)
    (enough bed2_18 hospital2)
    (enough bed2_19 hospital2)
    (enough bed2_20 hospital2)
    (enough bed2_21 hospital2)
    (enough bed2_22 hospital2)
    (enough bed2_23 hospital2)
    (enough bed2_24 hospital2)
    (enough bed2_25 hospital2)
    (enough bed2_26 hospital2)
    (enough bed2_27 hospital2)
    (enough bed2_28 hospital2)
    (enough bed2_29 hospital2)
    (enough bed2_30 hospital2)

    ;; hospital3 has 10 beds
    (enough bed3_1 hospital3)
    (enough bed3_2 hospital3)
    (enough bed3_3 hospital3)
    (enough bed3_4 hospital3)
    (enough bed3_5 hospital3)
    (enough bed3_6 hospital3)
    (enough bed3_7 hospital3)
    (enough bed3_8 hospital3)
    (enough bed3_9 hospital3)
    (enough bed3_10 hospital3)

    ;; firestation1 has 3 ambulances
    ;; firestation2 has 4 ambulances
    ;; firestation3 has 2 ambulances
    (at ambu1_1 firestation1)
    (at ambu1_2 firestation1)
    (at ambu1_3 firestation1)
    (at ambu2_1 firestation2)
    (at ambu2_2 firestation2)
    (at ambu2_3 firestation2)
    (at ambu2_4 firestation2)
    (at ambu3_1 firestation3)
    (at ambu3_2 firestation3)

    (empty ambu1_1)
    (empty ambu1_2)
    (empty ambu1_3)
    (empty ambu2_1)
    (empty ambu2_2)
    (empty ambu2_3)
    (empty ambu2_4)
    (empty ambu3_1)
    (empty ambu3_2)

    ;; Each ambulances have 2 ambulance_workers
    ;(works_in ambu_worker1_1 ambu1_1)
    ;(works_in ambu_worker1_2 ambu1_1)
    ;(works_in ambu_worker1_3 ambu1_2)
    ;(works_in ambu_worker1_4 ambu1_2)
    ;(works_in ambu_worker1_5 ambu1_3)
    ;(works_in ambu_worker1_6 ambu1_3)
    ;(works_in ambu_worker2_1 ambu2_1)
    ;(works_in ambu_worker2_2 ambu2_1)
    ;(works_in ambu_worker2_3 ambu2_2)
    ;(works_in ambu_worker2_4 ambu2_2)
    ;(works_in ambu_worker2_5 ambu2_3)
    ;(works_in ambu_worker2_6 ambu2_3)
    ;(works_in ambu_worker2_7 ambu2_4)
    ;(works_in ambu_worker2_8 ambu2_4)
    ;(works_in ambu_worker3_1 ambu3_1)
    ;(works_in ambu_worker3_2 ambu3_1)
    ;(works_in ambu_worker3_3 ambu3_2)
    ;(works_in ambu_worker3_4 ambu3_2)
  )

  (:goal 
    (and
      ;; patient1~10 -> hospital1 (bed1_1 ~ 1_10)
        (in patient1 bed1_1)
        (in patient2 bed1_2)
        (in patient3 bed1_3)
        (in patient4 bed1_4)
        (in patient5 bed1_5)
        (in patient6 bed1_6)
        (in patient7 bed1_7)
        (in patient8 bed1_8)
        (in patient9 bed1_9)
        (in patient10 bed1_10)

        ;; patient11~20 -> hospital2 (bed2_1 ~ 2_10)
        (in patient11 bed2_1)
        (in patient12 bed2_2)
        (in patient13 bed2_3)
        (in patient14 bed2_4)
        (in patient15 bed2_5)
        (in patient16 bed2_6)
        (in patient17 bed2_7)
        (in patient18 bed2_8)
        (in patient19 bed2_9)
        (in patient20 bed2_10)

        ;; patient21~30 -> hospital3
        (in patient21 bed3_1)
        (in patient22 bed3_2)
        (in patient23 bed3_3)
        (in patient24 bed3_4)
        (in patient25 bed3_5)
        (in patient26 bed3_6)
        (in patient27 bed3_7)
        (in patient28 bed3_8)
        (in patient29 bed3_9)
        (in patient30 bed3_10)

        ;; patient31~35 -> hospital1
        (in patient31 bed1_11)
        (in patient32 bed1_12)
        (in patient33 bed1_13)
        (in patient34 bed1_14)
        (in patient35 bed1_15)

        ;; patient36~40 -> hospital2
        (in patient36 bed2_11)
        (in patient37 bed2_12)
        (in patient38 bed2_13)
        (in patient39 bed2_14)
        (in patient40 bed2_15)
        
    )
  )

)