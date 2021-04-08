search([(A, B)|_], A, B) :-
    !.
search([_|A], B, C) :-
    search(A, B, C).

%query module
find_a_frame(FName, Param, X) :-
    frame(FName, Y),
    search(Y, Param, X).
find_a_frame(FName, Param, X) :-
    frame(FName, [(ako, FName2)|_]),
    find_a_frame(FName2, Param, X).
find_a_frame(FName, Param, X) :-
    frame(FName, [(a_part_of, FName2)|_]),
    find_a_frame(FName2, Param, X).
find_a_frame(FName, Param, X) :-
    frame(FName, [(inst, FName2)|_]),
    find_a_frame(FName2, Param, X).

%update module called when knowledge base has been modified
update:-
    telling(OldStream),
    tell('db.pl'),
    listing(frame),
    told,
    tell(OldStream).

%insert module
insert_a_frame(FName,_,_) :-
    frame(FName,_),
    !,
    write("Frame already exists, CANNOT INSERT").
insert_a_frame(FName, Parent_frame, Attri_list) :-
    frame(Parent_frame,_),
    assertz(frame(FName, Attri_list)),
    update,
    write("ADDED SUCCESSFULLY"),
    !.
insert_a_frame(_,_,_) :-
    write("Parent not found, CANNOT INSERT").

%deletion module
delete_a_frame(FName) :-
    frame(FName,_),
    frame(FName2,[(a_part_of, FName)|_]),
    delete_a_frame(FName2).
delete_a_frame(FName) :-
    frame(FName, _),
    frame(FName2, [(ako, FName)|_]),
    delete_a_frame(FName2).
delete_a_frame(FName) :-
    frame(FName, _),
    frame(FName2, [(inst, FName)|_]),
    delete_a_frame(FName2).
delete_a_frame(FName) :-
    frame(FName, Attri_list),
    write("SUCCESSFULLY DELETED"),
    retract(frame(FName, Attri_list)),
    update,
    write("SUCCESSFULLY DELETED"),
    !.
delete_a_frame(_) :-
    write("Parent not found, CANNOT DELETE").
