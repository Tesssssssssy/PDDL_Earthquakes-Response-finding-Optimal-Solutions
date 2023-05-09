(define (domain safety)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    AI_agent 
    school_info connection_status patients_info ambu_arrival_status 
    ambulance_worker emergency_patient
    school hospital firestation
    ambulance 
    bed 
  )

  (:predicates
    (have ?AI_agent - AI_agent ?school_info-or-connection_status-or-patients_info-or-ambu_arrival_status - (either school_info connection_status patients_info ambu_arrival_status))
    (in ?emergency_patient - emergency_patient ?school-or-ambulance-or-hospital-or-bed - (either school ambulance hospital bed))
    (works_in ?ambulance_worker ?ambulance)
    (enough ?bed ?hospital)
    (at ?ambulance - ambulance ?school-or-firestation-or-hospital - (either school firestation hospital))
    (empty ?ambulance-or-bed - (either ambulance bed))
  )

  (:action check_connection
      :parameters 
                (
                  ?AI_agent - AI_agent
                  ?school_info - school_info
                  ?connection_status - connection_status
                )
      :precondition 
                (and (have ?AI_agent ?school_info)
                     (not (have ?AI_agent ?connection_status)))
      
      :effect 
            (have ?AI_agent ?connection_status)
    )

    (:action send_information
      :parameters 
                (
                  ?AI_agent - AI_agent
                  ?emergency_patient - emergency_patient
                  ?school - school
                  ?ambulance - ambulance
                  ?patients_info - patients_info
                  ?connection_status - connection_status
                )
      :precondition 
                (
                  and (have ?AI_agent ?connection_status)
                      (in ?emergency_patient ?school)
                      (not (at ?ambulance ?school))
                      (not (have ?AI_agent ?patients_info))
                )
      :effect 
            (have ?AI_agent ?patients_info)
    )
  
    (:action start_ambulance
      :parameters 
                (
                  ?patients_info - patients_info
                  ?ambulance - ambulance
                  ?firestation - firestation
                  ?school - school
                  ?AI_agent - AI_agent
                )
      :precondition 
                (and (have ?AI_agent ?patients_info)
                      (at ?ambulance ?firestation)
                      (not (at ?ambulance ?school))
                      (empty ?ambulance)
                )
      
      :effect 
            (and (at ?ambulance ?school)
                 (not (at ?ambulance ?firestation))
            )
    )
  
    (:action report_ambulance_arrival
      :parameters 
                (
                  ?ambulance - ambulance
                  ?school - school
                  ?firestation - firestation
                  ?AI_agent - AI_agent
                  ?ambu_arrival_status - ambu_arrival_status
                )
      :precondition 
                (and (at ?ambulance ?school)
                     (not (at ?ambulance ?firestation))
                     (not (have ?AI_agent ?ambu_arrival_status))
                )
      :effect 
            (have ?AI_agent ?ambu_arrival_status)
    )

    (:action load_ambulance
      :parameters 
                (
                  ?emergency_patient - emergency_patient
                  ?school - school
                  ?ambulance - ambulance
                  ?AI_agent - AI_agent
                  ?ambu_arrival_status - ambu_arrival_status
                )
      :precondition 
                (and (have ?AI_agent ?ambu_arrival_status)
                     (in ?emergency_patient ?school)
                     (empty ?ambulance)
                     (at ?ambulance ?school)
                )
      :effect 
            (and (not (in ?emergency_patient ?school))
                 (in ?emergency_patient ?ambulance)
                 (not (empty ?ambulance))
            )
    )
   
    (:action move_ambulance
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
                )
      :effect 
            (and (not (at ?ambulance ?school))
                 (at ?ambulance ?hospital)
            )
    )

    (:action unload_ambulance
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
            )
    )

    (:action go_to_bed
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

    (:action move_back_ambulance
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
                )
      :effect 
            (and (at ?ambulance ?school)
                 (not (at ?ambulance ?hospital))              
            )
    )
        
    (:action transfer_end
      :parameters 
                (
                  ?emergency_patient - emergency_patient
                  ?school - school
                  ?patients_info - patients_info
                  ?connection_status - connection_status
                  ?AI_agent - AI_agent
                )
      :precondition 
                (and (not (in ?emergency_patient ?school))
                     (have ?AI_agent ?patients_info)
                     (have ?AI_agent ?connection_status)
                )
      
      :effect 
            (and (not (have ?AI_agent ?patients_info))
                 (not (have ?AI_agent ?connection_status))
            )
    )
)