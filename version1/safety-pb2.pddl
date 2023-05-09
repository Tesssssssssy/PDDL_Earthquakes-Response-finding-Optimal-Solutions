(define (problem safety-pb2)
  (:domain safety)
  (:requirements :strips :typing :negative-preconditions) 

  (:objects
    ai_agent - AI_agent

    si - school_info
    cs - connection_status
    pi - patients_info
    aas - ambu_arrival_status

    school1 school2 school3 school4 school5 - school
    hospital1 hospital2 hospital3 hospital4 - hospital
    firestation1 firestation2 firestation3 firestation4 - firestation
    ambu1_1 ambu1_2 ambu1_3 ambu2_1 ambu2_2 ambu2_3 ambu2_4 ambu3_1 ambu3_2 ambu3_3 ambu3_4 ambu4_1 ambu4_2 ambu4_3 ambu4_4 - ambulance

    ;ambu_worker1_1 ambu_worker1_2 ambu_worker1_3 ambu_worker1_4 ambu_worker1_5 ambu_worker1_6
    ;ambu_worker2_1 ambu_worker2_2 ambu_worker2_3 ambu_worker2_4 ambu_worker2_5 ambu_worker2_6 ambu_worker2_7 ambu_worker2_8
    ;ambu_worker3_1 ambu_worker3_2 ambu_worker3_3 ambu_worker3_4 - ambulance_worker

    bed1_1 bed1_2 bed1_3 bed1_4 bed1_5 bed1_6 bed1_7 bed1_8 bed1_9 bed1_10
    bed1_11 bed1_12 bed1_13 bed1_14 bed1_15 bed1_16 bed1_17 bed1_18 bed1_19 bed1_20 bed1_21 bed1_22 bed1_23 bed1_24 bed1_25
    bed2_1 bed2_2 bed2_3 bed2_4 bed2_5 bed2_6 bed2_7 bed2_8 bed2_9 bed2_10
    bed2_11 bed2_12 bed2_13 bed2_14 bed2_15 bed2_16 bed2_17 bed2_18 bed2_19 bed2_20
    bed2_21 bed2_22 bed2_23 bed2_24 bed2_25 bed2_26 bed2_27 bed2_28 bed2_29 bed2_30
    bed3_1 bed3_2 bed3_3 bed3_4 bed3_5 bed3_6 bed3_7 bed3_8 bed3_9 bed3_10 
    bed4_1 bed4_2 bed4_3 bed4_4 bed4_5 bed4_6 bed4_7 bed4_8 bed4_9 bed4_10
    bed4_11 bed4_12 bed4_13 bed4_14 bed4_15 bed4_16 bed4_17 bed4_18 bed4_19 bed4_20 - bed
    
    patient1 patient2 patient3 patient4 patient5 patient6 patient7 patient8 patient9 patient10
    patient11 patient12 patient13 patient14 patient15 patient16 patient17 patient18 patient19 patient20
    patient21 patient22 patient23 patient24 patient25 patient26 patient27 patient28 patient29 patient30
    patient31 patient32 patient33 patient34 patient35 patient36 patient37 patient38 patient39 patient40
    patient41 patient42 patient43 patient44 patient45 patient46 patient47 patient48 patient49 patient50
    patient51 patient52 patient53 patient54 patient55 patient56 patient57 patient58 patient59 patient60
    patient61 patient62 patient63 patient64 patient65 patient66 patient67 patient68 patient69 patient70
    patient71 patient72 patient73 patient74 patient75 patient76 patient77 patient78 patient79 patient80 
    patient81 patient82 patient83 patient84 patient85 - emergency_patient
  )
  (:init
    ;patient1~20 - school1 (20 patients)
    ;patient21~40 - school2 (20 patients)
    ;patient41~60 - school3 (20 patients)
    ;patient61~80 - school4 (20 patients)
    ;patient81~85 - school5 (5 patients)
    ;-> total patients: 85
  
    ;hospital1 - bed1_1 ~ 1_25 (25 beds)
    ;hospital2 - bed2_1 ~ 2_30 (30 beds)
    ;hospital3 - bed3_1 ~ 3_10 (10 beds)
    ;hospital4 - bed4_1 ~ 4_20 (20 beds)
    ; -> total beds: 85

    (have ai_agent si)
    (not (have ai_agent cs))
    (not (have ai_agent aas))
    (not (have ai_agent pi))

    ;patient1~20 - school1
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
    (in patient11 school1)
    (in patient12 school1)
    (in patient13 school1)
    (in patient14 school1)
    (in patient15 school1)
    (in patient16 school1)
    (in patient17 school1)
    (in patient18 school1)
    (in patient19 school1)
    (in patient20 school1)

    ;patient21~40 - school2
    (in patient21 school2)
    (in patient22 school2)
    (in patient23 school2)
    (in patient24 school2)
    (in patient25 school2)
    (in patient26 school2)
    (in patient27 school2)
    (in patient28 school2)
    (in patient29 school2)
    (in patient30 school2)
    (in patient31 school2)
    (in patient32 school2)
    (in patient33 school2)
    (in patient34 school2)
    (in patient35 school2)
    (in patient36 school2)
    (in patient37 school2)
    (in patient38 school2)
    (in patient39 school2)
    (in patient40 school2)

    ;patient41~60 - school3
    (in patient41 school3)
    (in patient42 school3)
    (in patient43 school3)
    (in patient44 school3)
    (in patient45 school3)
    (in patient46 school3)
    (in patient47 school3)
    (in patient48 school3)
    (in patient49 school3)
    (in patient50 school3)
    (in patient51 school3)
    (in patient52 school3)
    (in patient53 school3)
    (in patient54 school3)
    (in patient55 school3)
    (in patient56 school3)
    (in patient57 school3)
    (in patient58 school3)
    (in patient59 school3)
    (in patient60 school3)

    ;patient61~80 - school4
    (in patient61 school4)
    (in patient62 school4)
    (in patient63 school4)
    (in patient64 school4)
    (in patient65 school4)
    (in patient66 school4)
    (in patient67 school4)
    (in patient68 school4)
    (in patient69 school4)
    (in patient70 school4)
    (in patient71 school4)
    (in patient72 school4)
    (in patient73 school4)
    (in patient74 school4)
    (in patient75 school4)
    (in patient76 school4)
    (in patient77 school4)
    (in patient78 school4)
    (in patient79 school4)
    (in patient80 school4)

    ;patient81~85 - school5
    (in patient81 school5)
    (in patient82 school5)
    (in patient83 school5)
    (in patient84 school5)
    (in patient85 school5)

    ;hospital1 - bed1_1 ~ 1_25
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
    (enough bed1_21 hospital1)
    (enough bed1_22 hospital1)
    (enough bed1_23 hospital1)
    (enough bed1_24 hospital1)
    (enough bed1_25 hospital1)

    ;hospital2 - bed2_1 ~ 2_30
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

    ;hospital3 - bed3_1 ~ 3_10
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

    ;hospital4 - bed4_1 ~ 4_20
    (enough bed4_1 hospital4)
    (enough bed4_2 hospital4)
    (enough bed4_3 hospital4)
    (enough bed4_4 hospital4)
    (enough bed4_5 hospital4)
    (enough bed4_6 hospital4)
    (enough bed4_7 hospital4)
    (enough bed4_8 hospital4)
    (enough bed4_9 hospital4)
    (enough bed4_10 hospital4)
    (enough bed4_11 hospital4)
    (enough bed4_12 hospital4)
    (enough bed4_13 hospital4)
    (enough bed4_14 hospital4)
    (enough bed4_15 hospital4)
    (enough bed4_16 hospital4)
    (enough bed4_17 hospital4)
    (enough bed4_18 hospital4)
    (enough bed4_19 hospital4)
    (enough bed4_20 hospital4)    

    ;firestation1 - ambulance 3
    ;firestation2 - ambulance 4
    ;firestation3 - ambulance 4
    ;firestation4 - ambulance 4
    ; -> total ambulances: 15

    (at ambu1_1 firestation1)
    (at ambu1_2 firestation1)
    (at ambu1_3 firestation1)

    (at ambu2_1 firestation2)
    (at ambu2_2 firestation2)
    (at ambu2_3 firestation2)
    (at ambu2_4 firestation2)

    (at ambu3_1 firestation3)
    (at ambu3_2 firestation3)
    (at ambu3_3 firestation3)
    (at ambu3_4 firestation3)

    (at ambu4_1 firestation4)
    (at ambu4_2 firestation4)
    (at ambu4_3 firestation4)
    (at ambu4_4 firestation4)

    (empty ambu1_1)
    (empty ambu1_2)
    (empty ambu1_3)
    (empty ambu2_1)
    (empty ambu2_2)
    (empty ambu2_3)
    (empty ambu2_4)
    (empty ambu3_1)
    (empty ambu3_2)
    (empty ambu3_3)
    (empty ambu3_4)
    (empty ambu4_1)
    (empty ambu4_2)
    (empty ambu4_3)
    (empty ambu4_4)
  )
  
  (:goal 
    ;init>
    ;patient1~20 - school1 (20 patients)
    ;patient21~40 - school2 (20 patients)
    ;patient41~60 - school3 (20 patients)
    ;patient61~80 - school4 (20 patients)
    ;patient81~85 - school5 (5 patients)
    ;-> total patients: 85
  
    ;hospital1 - bed1_1 ~ 1_25 (25 beds)
    ;hospital2 - bed2_1 ~ 2_30 (30 beds)
    ;hospital3 - bed3_1 ~ 3_10 (10 beds)
    ;hospital4 - bed4_1 ~ 4_20 (20 beds)
    ; -> total beds: 85

    ;goal>
    ; patient1~10 -> bed2_1 ~ 2_10 (rest: 20/30 - hospital2)
    ; patient11~20 -> bed3_1 ~ 3_10 (rest: 0/10 - hospital3)
    ; patient21~35 -> bed4_1 ~ 4_15 (rest: 5/20 - hospital4)
    ; patient36~40 -> bed2_11 ~ 2_15 (rest: 15/30 - hospital2)
    ; patient41~60 -> bed1_1 ~ 1_20 (rest: 5/25 - hospital1)
    ; patient61~70 -> bed2_16 ~ 2_25 (rest: 5/30 - hospital2)
    ; patient71~75 -> bed4_16 ~ 4_20 (rest: 0/20 - hospital4)
    ; patient76~80 -> bed1_21 ~ 1_25 (rest: 0/25 - hospital1)
    ; patient81~85 -> bed 2_26 ~ 2_30 (rest: 0/30 - hospital2)
    (and
      ; patient1~10 -> bed2_1 ~ 2_10 (rest: 20/30 - hospital2)
        (in patient1 bed2_1)
        (in patient2 bed2_2)
        (in patient3 bed2_3)
        (in patient4 bed2_4)
        (in patient5 bed2_5)
        (in patient6 bed2_6)
        (in patient7 bed2_7)
        (in patient8 bed2_8)
        (in patient9 bed2_9)
        (in patient10 bed2_10)

      ; patient11~20 -> bed3_1 ~ 3_10 (rest: 0/10 - hospital3)
        (in patient11 bed3_1)
        (in patient12 bed3_2)
        (in patient13 bed3_3)
        (in patient14 bed3_4)
        (in patient15 bed3_5)
        (in patient16 bed3_6)
        (in patient17 bed3_7)
        (in patient18 bed3_8)
        (in patient19 bed3_9)
        (in patient20 bed3_10)

      ; patient21~35 -> bed4_1 ~ 4_15 (rest: 5/20 - hospital4)
        (in patient21 bed4_1)
        (in patient22 bed4_2)
        (in patient23 bed4_3)
        (in patient24 bed4_4)
        (in patient25 bed4_5)
        (in patient26 bed4_6)
        (in patient27 bed4_7)
        (in patient28 bed4_8)
        (in patient29 bed4_9)
        (in patient30 bed4_10)
        (in patient31 bed4_11)
        (in patient32 bed4_12)
        (in patient33 bed4_13)
        (in patient34 bed4_14)
        (in patient35 bed4_15)

      ; patient36~40 -> bed2_11 ~ 2_15 (rest: 15/30 - hospital2)
        (in patient36 bed2_11)
        (in patient37 bed2_12)
        (in patient38 bed2_13)
        (in patient39 bed2_14)
        (in patient40 bed2_15)

      ; patient41~60 -> bed1_1 ~ 1_20 (rest: 5/25 - hospital1)
        (in patient41 bed1_1)
        (in patient42 bed1_2)
        (in patient43 bed1_3)
        (in patient44 bed1_4)
        (in patient45 bed1_5)
        (in patient46 bed1_6)
        (in patient47 bed1_7)
        (in patient48 bed1_8)
        (in patient49 bed1_9)
        (in patient50 bed1_10)
        (in patient51 bed1_11)
        (in patient52 bed1_12)
        (in patient53 bed1_13)
        (in patient54 bed1_14)
        (in patient55 bed1_15)
        (in patient56 bed1_16)
        (in patient57 bed1_17)
        (in patient58 bed1_18)
        (in patient59 bed1_19)
        (in patient60 bed1_20)

      ; patient61~70 -> bed2_16 ~ 2_25 (rest: 5/30 - hospital2)
        (in patient61 bed2_16)
        (in patient62 bed2_17)
        (in patient63 bed2_18)
        (in patient64 bed2_19)
        (in patient65 bed2_20)
        (in patient66 bed2_21)
        (in patient67 bed2_22)
        (in patient68 bed2_23)
        (in patient69 bed2_24)
        (in patient70 bed2_25)

      ; patient71~75 -> bed4_16 ~ 4_20 (rest: 0/20 - hospital4)
        (in patient71 bed4_16)
        (in patient72 bed4_17)
        (in patient73 bed4_18)
        (in patient74 bed4_19)
        (in patient75 bed4_20)

      ; patient76~80 -> bed1_21 ~ 1_25 (rest: 0/25 - hospital1)
        (in patient76 bed1_21)
        (in patient77 bed1_22)
        (in patient78 bed1_23)
        (in patient79 bed1_24)
        (in patient80 bed1_25)

      ; patient81~85 -> bed 2_26 ~ 2_30 (rest: 0/30 - hospital2)
        (in patient81 bed2_26)
        (in patient82 bed2_27)
        (in patient83 bed2_28)
        (in patient84 bed2_29)
        (in patient85 bed2_30)
        
    )
  )

)