(define (problem safety2-pb2) 
    (:domain safety2)
    (:objects 
        school1 school2 school3 - school
        hospital1 hospital2 hospital3 hospital4 - hospital
        firestation1 firestation2 firestation3 - firestation
        ambu1_1 ambu1_2 ambu2_1 ambu2_2 ambu3_1 ambu3_2  ambu3_3 - ambulance

        bed1_1 bed1_2 bed1_3 bed1_4 bed1_5 bed1_6 bed1_7 bed1_8 bed1_9 bed1_10 bed1_11 bed1_12 bed1_13 bed1_14 bed1_15
        bed2_1 bed2_2 bed2_3 bed2_4 bed2_5 bed2_6 bed2_7 bed2_8 bed2_9 bed2_10
        bed3_1 bed3_2 bed3_3 bed3_4 bed3_5
        bed4_1 bed4_2 bed4_3 bed4_4 bed4_5 bed4_6 bed4_7 bed4_8 bed4_9 bed4_10 - bed
        
        patient1 patient2 patient3 patient4 patient5 patient6 patient7 patient8 patient9 patient10
        patient11 patient12 patient13 patient14 patient15 patient16 patient17 patient18 patient19 patient20
        patient21 patient22 patient23 patient24 patient25 patient26 patient27 patient28 patient29 patient30
        patient31 patient32 patient33 patient34 patient35 - emergency_patient
    )

    (:init
        (= (distance1 firestation1 school1) 5)
        (= (distance1 firestation1 school2) 2)
        (= (distance1 firestation1 school3) 3)
        (= (distance1 firestation2 school1) 2)
        (= (distance1 firestation2 school2) 4)
        (= (distance1 firestation2 school3) 5)
        (= (distance1 firestation3 school1) 2)
        (= (distance1 firestation3 school2) 5)
        (= (distance1 firestation3 school3) 7)

        (= (distance2 school1 hospital1) 2)
        (= (distance2 school1 hospital2) 3)
        (= (distance2 school1 hospital3) 4)
        (= (distance2 school1 hospital4) 5)
        (= (distance2 school2 hospital1) 2)
        (= (distance2 school2 hospital2) 1)
        (= (distance2 school2 hospital3) 5)
        (= (distance2 school2 hospital4) 2)
        (= (distance2 school3 hospital1) 3)
        (= (distance2 school3 hospital2) 3)
        (= (distance2 school3 hospital3) 4)
        (= (distance2 school3 hospital4) 2)

        (= (distance3 hospital1 firestation1) 7)
        (= (distance3 hospital1 firestation2) 6)
        (= (distance3 hospital1 firestation3) 5)
        (= (distance3 hospital2 firestation1) 2)
        (= (distance3 hospital2 firestation2) 6)
        (= (distance3 hospital2 firestation3) 7)
        (= (distance3 hospital3 firestation1) 2)
        (= (distance3 hospital3 firestation2) 5)
        (= (distance3 hospital3 firestation3) 4)
        (= (distance3 hospital4 firestation1) 3)
        (= (distance3 hospital4 firestation2) 2)
        (= (distance3 hospital4 firestation3) 1)

        (= (fuel-amount ambu1_1) 60)
        (= (fuel-amount ambu1_2) 70)
        (= (fuel-amount ambu2_1) 80)
        (= (fuel-amount ambu2_2) 90)
        (= (fuel-amount ambu3_1) 100)
        (= (fuel-amount ambu3_2) 60)
        (= (fuel-amount ambu3_3) 80)

        (= (time ambu1_1) 0)
        (= (time ambu1_2) 0)
        (= (time ambu2_1) 0)
        (= (time ambu2_2) 0)
        (= (time ambu3_1) 0)
        (= (time ambu3_2) 0)
        (= (time ambu3_3) 0)

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

        (in patient16 school2)
        (in patient17 school2)
        (in patient18 school2)
        (in patient19 school2)
        (in patient20 school2)
        (in patient21 school2)
        (in patient22 school2)
        (in patient23 school2)
        (in patient24 school2)
        (in patient25 school2)

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

        (enough bed3_1 hospital3)
        (enough bed3_2 hospital3)
        (enough bed3_3 hospital3)
        (enough bed3_4 hospital3)
        (enough bed3_5 hospital3)

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

        (at ambu1_1 firestation1)
        (at ambu1_2 firestation1)
        (at ambu2_1 firestation2)
        (at ambu2_2 firestation2)
        (at ambu3_1 firestation3)
        (at ambu3_1 firestation3)
        (at ambu3_3 firestation3)

        (empty ambu1_1)
        (empty ambu1_2)
        (empty ambu2_1)
        (empty ambu2_2)
        (empty ambu3_1)
        (empty ambu3_2)
        (empty ambu3_3)

    )

    (:goal 
        (and 
            (in patient1 bed4_1)
            (in patient2 bed4_2)
            (in patient3 bed4_3)
            (in patient4 bed4_4)
            (in patient5 bed4_5)

            (in patient6 bed2_1)
            (in patient7 bed2_2)
            (in patient8 bed2_3)
            (in patient9 bed2_4)
            (in patient10 bed2_5)

            (in patient11 bed1_1)
            (in patient12 bed1_2)
            (in patient13 bed1_3)
            (in patient14 bed1_4)
            (in patient15 bed1_5)
            (in patient16 bed1_6)

            (in patient17 bed2_6)
            (in patient18 bed2_7)
            (in patient19 bed2_8)
            (in patient20 bed2_9)

            (in patient21 bed1_7)
            (in patient22 bed1_8)
            (in patient23 bed1_9)
            (in patient24 bed1_10)
            (in patient25 bed1_11)
            (in patient26 bed1_12)
            (in patient27 bed1_13)
            (in patient28 bed1_14)
            (in patient29 bed1_15)

            (in patient30 bed2_10)

            (in patient31 bed4_6)
            (in patient32 bed4_7)
            (in patient33 bed4_8)
            (in patient34 bed4_9)
            (in patient35 bed4_10)
            
        )
        
    )

    (:metric minimize (time))

)