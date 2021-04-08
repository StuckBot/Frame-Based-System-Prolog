:- dynamic frame/2.

frame(hospital, [nil,  (phone, default, "0120 3819100"),  (address, default, "Delhi")]).
frame(department, [(a_part_of, hospital),  (staff_no, range, 1, 100)]).
frame(infrastructure, [(a_part_of, hospital),  (year, range, 2010, 2021),  (cost, range, 50000, 5000000)]).
frame(icu, [(ako, infrastructure),  (rooms, value, 10)]).
frame(or, [(ako, infrastructure),  (rooms, value, 5)]).
frame(doctor, [(a_part_of, department),  (salary, default, 2000000)]).
frame(nurses, [(a_part_of, department),  (salary, default, 20000)]).
frame(cardio, [(ako, doctor),  (qual, default, "phd cardio")]).
frame(neuro, [(ako, doctor),  (qual, default, "phd neuro")]).
frame(derek, [(inst, cardio),  (name, value, "Derek"),  (id, value, 165)]).
frame(owen, [(inst, neuro),  (name, value, "Owen"),  (id, value, 175)]).
frame(john, [(inst, nurses),  (name, value, "John"),  (id, value, 265)]).
frame(sally, [(inst, nurses),  (name, value, "Sally"),  (id, value, 365)]).
frame(room101, [(inst, icu),  (name, value, "Room 101"),  (patient, value, "Jessica")]).
frame(room102, [(inst, icu),  (name, value, "Room 102"),  (patient, value, "Rown")]).

