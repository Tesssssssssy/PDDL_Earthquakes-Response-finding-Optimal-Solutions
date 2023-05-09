(define (problem safety2-pb1) 
    (:domain safety2)
    (:objects 
        school1 school2 school3 - school
        hospital1 hospital2 hospital3 - hospital
        firestation1 firestation2 - firestation
        ambu1_1 ambu1_2 ambu2_1 ambu2_2 - ambulance

        bed1_1 bed1_2 bed1_3 bed1_4 bed1_5 bed1_6 bed1_7 bed1_8 bed1_9 bed1_10
        bed2_1 bed2_2 bed2_3 bed2_4 bed2_5 bed2_6 bed2_7 bed2_8 bed2_9 bed2_10
        bed3_1 bed3_2 bed3_3 bed3_4 bed3_5 - bed
        
        patient1 patient2 patient3 patient4 patient5 patient6 patient7 patient8 patient9 patient10
        patient11 patient12 patient13 patient14 patient15 patient16 patient17 patient18 patient19 patient20 - emergency_patient
    )

    ;todo: put the initial state's facts and numeric values here
    (:init
        (= (distance1 firestation1 school1) 1)
        (= (distance1 firestation1 school2) 2)
        (= (distance1 firestation2 school1) 2)
        (= (distance1 firestation2 school2) 1)

        (= (distance2 school1 hospital1) 1)
        (= (distance2 school1 hospital2) 2)
        (= (distance2 school1 hospital3) 3)
        (= (distance2 school2 hospital1) 3)
        (= (distance2 school2 hospital2) 2)
        (= (distance2 school2 hospital3) 1)

        (= (distance3 hospital1 firestation1) 2)
        (= (distance3 hospital2 firestation1) 3)
        (= (distance3 hospital3 firestation1) 3)
        (= (distance3 hospital1 firestation2) 3)
        (= (distance3 hospital2 firestation2) 4)
        (= (distance3 hospital3 firestation2) 2)

        (= (fuel-amount ambu1_1) 50)
        (= (fuel-amount ambu1_2) 80)
        (= (fuel-amount ambu2_1) 100)
        (= (fuel-amount ambu2_2) 60)

        (= (time ambu1_1) 0)
        (= (time ambu1_2) 0)
        (= (time ambu2_1) 0)
        (= (time ambu2_2) 0)

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

        (at ambu1_1 firestation1)
        (at ambu1_2 firestation1)
        (at ambu2_1 firestation2)
        (at ambu2_2 firestation2)

        (empty ambu1_1)
        (empty ambu1_2)
        (empty ambu2_1)
        (empty ambu2_2)

    )

    ;todo: put the goal condition here
    (:goal 
        (and
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

            (in patient11 bed2_1)
            (in patient12 bed2_2)
            (in patient13 bed2_3)
            (in patient14 bed2_4)
            (in patient15 bed2_5)

            (in patient16 bed3_1)
            (in patient17 bed3_2)
            (in patient18 bed3_3)
            (in patient19 bed3_4)
            (in patient20 bed3_5)
        )
    )

            
    ;un-comment the following line if metric is needed
    ;(:metric minimize (???)
    (:metric minimize (time))
)
