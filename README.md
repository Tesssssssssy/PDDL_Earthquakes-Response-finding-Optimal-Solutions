# PDDL_Earthquakes-Response-finding-Optimal-Solutions
PDDL programming
- This is a kind of imagination programming for the emergency. If the disaster happens, this can be a model for the emergency.
- This pddl files is run by Metric-FF, LPG-td-1.4, etc planners.
- I made a code about the domain and problem and the code is run by planners.
- I didn't make the planners, I just used it. 
- Each planners give different results, so I can choose the best planner for me.

## Environments
- Ubuntu 20.04 LTS

## Planners
- LPG-td 1.0/1.4
- Metric-FF 
- etc

I finally got some optimal solutions using planners.
This can help for the firefighter, ambulance, hospital, school etc in rescuing patients.

### Plan Results
- by Metric-FF planner
- ./ff -o safety.pddl -f safety-pb1.pddl
<img width="685" alt="1" src="https://github.com/Tesssssssssy/PDDL_Earthquakes-Response-finding-Optimal-Solutions/assets/105422037/f0c6ffe2-07a2-46b2-849c-5f00163cd5c6">
<img width="613" alt="2" src="https://github.com/Tesssssssssy/PDDL_Earthquakes-Response-finding-Optimal-Solutions/assets/105422037/eef3d10a-068d-48c0-a603-7ebff351124f">
<img width="571" alt="3" src="https://github.com/Tesssssssssy/PDDL_Earthquakes-Response-finding-Optimal-Solutions/assets/105422037/1918a06e-26eb-435a-8771-5a0961daa9ff">
<img width="662" alt="4" src="https://github.com/Tesssssssssy/PDDL_Earthquakes-Response-finding-Optimal-Solutions/assets/105422037/9bd6b536-d67e-4f2a-b245-b0727d105fd2">
<img width="682" alt="5" src="https://github.com/Tesssssssssy/PDDL_Earthquakes-Response-finding-Optimal-Solutions/assets/105422037/3b4615dc-3afc-4025-8e63-edd5ea4bdc36">
<img width="719" alt="6" src="https://github.com/Tesssssssssy/PDDL_Earthquakes-Response-finding-Optimal-Solutions/assets/105422037/97a99b01-e31f-4ed7-b3f5-eceef0825d56">
<img width="656" alt="7" src="https://github.com/Tesssssssssy/PDDL_Earthquakes-Response-finding-Optimal-Solutions/assets/105422037/0b94af76-ef66-4fa8-b376-ca78cd0ca869">
<img width="805" alt="8" src="https://github.com/Tesssssssssy/PDDL_Earthquakes-Response-finding-Optimal-Solutions/assets/105422037/97b550d0-6bd0-476e-881e-4f837b0020e2">

- by LPG-td-1.4 Planner
- ./lpg-td -o safety.pddl -f safety-pb1.pddl -n 1
<img width="821" alt="a" src="https://github.com/Tesssssssssy/PDDL_Earthquakes-Response-finding-Optimal-Solutions/assets/105422037/96d27853-2d69-4d26-88d9-f408a676ae4c">
<img width="775" alt="b" src="https://github.com/Tesssssssssy/PDDL_Earthquakes-Response-finding-Optimal-Solutions/assets/105422037/0dc5f150-9edb-493e-9a26-9b156af8a685">
<img width="815" alt="c" src="https://github.com/Tesssssssssy/PDDL_Earthquakes-Response-finding-Optimal-Solutions/assets/105422037/c88696df-0459-4463-b385-25e31bbb3947">
<img width="752" alt="d" src="https://github.com/Tesssssssssy/PDDL_Earthquakes-Response-finding-Optimal-Solutions/assets/105422037/c4e1d9a4-5a83-4461-930d-123da1215748">
<img width="725" alt="e" src="https://github.com/Tesssssssssy/PDDL_Earthquakes-Response-finding-Optimal-Solutions/assets/105422037/95ff1f09-bd76-4bf9-9497-c2225401cf8a">
<img width="542" alt="f" src="https://github.com/Tesssssssssy/PDDL_Earthquakes-Response-finding-Optimal-Solutions/assets/105422037/a0473d90-29e3-4fc0-918a-0bdf7cc0c52b">
