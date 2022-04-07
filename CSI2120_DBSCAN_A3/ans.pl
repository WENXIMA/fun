import:-
    csv_read_file('partition65.csv', Data65, [functor(partition)]),maplist(assert, Data65),
    csv_read_file('partition74.csv', Data74, [functor(partition)]),maplist(assert, Data74),
    csv_read_file('partition75.csv', Data75, [functor(partition)]),maplist(assert, Data75),
    csv_read_file('partition76.csv', Data76, [functor(partition)]),maplist(assert, Data76),
    csv_read_file('partition84.csv', Data84, [functor(partition)]),maplist(assert, Data84),
    csv_read_file('partition85.csv', Data85, [functor(partition)]),maplist(assert, Data85),
    csv_read_file('partition86.csv', Data86, [functor(partition)]),maplist(assert, Data86),listing(partition).

%get all partitions
get_partitions(Partitions):-
    setof(PARTITION_ID,POINT_ID^X^Y^CLUSTER_ID^partition(PARTITION_ID,POINT_ID,X,Y,CLUSTER_ID),Partitions).
%get all poins within a partition
get_points_by_partition(PARTITION_ID,R):-
    findall((PARTITION_ID,POINT_ID,X,Y,CLUSTER_ID),partition(PARTITION_ID,POINT_ID,X,Y,CLUSTER_ID),R).
%get all ids for points

get_cluster_id(Points,ID):-
    get_cluster_id(Points,[],ID).
get_cluster_id([],ID,ID).
get_cluster_id([(_,_,_,_,CLUSTER_ID)|Points],L,ID):-
    member(CLUSTER_ID,L),
    get_cluster_id(Points,L,ID),!.
get_cluster_id([(_,_,_,_,CLUSTER_ID)|Points],L,ID):-
    \+member(CLUSTER_ID,L),
    append(L,[CLUSTER_ID],L1),
    get_cluster_id(Points,L1,ID).
%get points within a cluster id.
get_points_by_cluster_id([],_,[]).
get_points_by_cluster_id([(PARTITION_ID,POINT_ID,X,Y,CLUSTER_ID)|Points],CLUSTER_ID,[(PARTITION_ID,POINT_ID,X,Y,CLUSTER_ID)|R]):-
    get_points_by_cluster_id(Points,CLUSTER_ID,R), !.
get_points_by_cluster_id([(_ |Points)],CLUSTER_ID,R):-
    get_points_by_cluster_id(Points,CLUSTER_ID,R).
%intersection(failed to using original intersect method)
intersect((_,POINT_ID,_,_,_),[(_,POINT_ID,_,_,_)|_]):-!.
intersect(Point,[_|Points]):-
    intersect(Point,Points).
intersection([],_,[]).
intersection([Point|List1],List2,[Point|List3]):-
    intersect(Point,List2),
    intersection(List1,List2,List3),!.
intersection([_|List1],List2,List3):-
    intersection(List1,List2,List3).


% relabel/4
% relabels the points of cluster O with label R
% relabel(O,R,clusterListIn, clusterListOut)
relabel(_,_,[],[]).
relabel(O,R,[(PARTITION_ID,PO_ID,X,Y,O)|CIn],[(PARTITION_ID,PO_ID,X,Y,R)|COut]):-
    relabel(O,R,CIn,COut),!.
relabel(O,R,[Point|CIn],[Point|COut]):-
    relabel(O,R,CIn,COut).

relabelAll([],_,Result,Result).
relabelAll([O|Labels],R,CIn,Result):-
    relabel(O,R,CIn,COut),
    relabelAll(Labels,R,COut,Result).

mergeClusters


test(get_partitions):-
    writeln('get_partitions(Partitions)'),
    get_partitions(Partitions),
    write(Partitions).
test(get_points_by_partition):-
     writeln('get_points_by_partition(65,R)'),
    get_points_by_partition(65,R),
    length(R,N),
    write(N),
    write('poins in the partition 65').
test(get_points_by_partition):-

 writeln('get_points_by_partition(74,R)'),
    get_points_by_partition(74,R),
    length(R,N),
    write(N),
    write('poins in the partition 74').
test(get_points_by_partition):-

 writeln('get_points_by_partition(75,R)'),
    get_points_by_partition(75,R),
    length(R,N),
    write(N),
    write('poins in the partition 75').
test(get_points_by_partition):-

 writeln('get_points_by_partition(76,R)'),
    get_points_by_partition(76,R),
    length(R,N),
    write(N),
    write('poins in the partition 76').
test(get_points_by_partition):-

 writeln('get_points_by_partition(84,R)'),
    get_points_by_partition(84,R),
    length(R,N),
    write(N),
    write('poins in the partition84').
test(get_points_by_partition):-

 writeln('get_points_by_partition(85,R)'),
    get_points_by_partition(85,R),
    length(R,N),
    write(N),
    write('poins in the partition 85').
test(get_points_by_partition):-

    writeln('get_points_by_partition(86,R)'),
    get_points_by_partition(86,R),
    length(R,N),
    write(N),
    write('poins in the partition86').
test(get_cluster_id):-
    writeln('There are'),
    get_points_by_partition(65,Points),
    get_cluster_id(Points,ID),
    write(ID),
    writeln('in partition 65').
test(get_cluster_id):-
    writeln('There are'),
    get_points_by_partition(74,Points),
    get_cluster_id(Points,ID),
    write(ID),
    writeln('in partition 74').

test(get_cluster_id):-
    writeln('There are'),
    get_points_by_partition(75,Points),
    get_cluster_id(Points,ID),
    write(ID),
    writeln('in partition 75').
test(get_cluster_id):-
    writeln('There are'),
    get_points_by_partition(76,Points),
    get_cluster_id(Points,ID),
    write(ID),
    writeln('in partition 76').
test(get_cluster_id):-
    writeln('There are'),
    get_points_by_partition(84,Points),
    get_cluster_id(Points,ID),
    write(ID),
    writeln('in partition 84').
test(get_cluster_id):-
    writeln('There are'),
    get_points_by_partition(85,Points),
    get_cluster_id(Points,ID),
    write(ID),
    writeln('in partition 85').
test(get_cluster_id):-
    writeln('There are'),
    get_points_by_partition(86,Points),
    get_cluster_id(Points,ID),
    write(ID),
    writeln('in partition 86').


test(get_points_by_cluster_id):-
    get_points_by_partition(65,Points),
    get_points_by_cluster_id(Points,65000001,R),
    write(R).

test(intersect):-
    intersect((0,1,0,0,1),[(0,2,0,0,1),(0,1,0,0,1)]).

test(intersection):-
    intersection([(0,1,0,0,1),(0,2,1,0,0)],[(0,2,1,0,0),(0,4,0,0,1)],R),
    write(R).
test(relabel):-
    relabel(33,77,[(1,1,1,1,33),(1,1,1,1,33),(1,1,1,1,77)],Result),
    write(Result).
test(relabelAll):-
    relabelAll([1,2,3],100,[(0,0,0,0,1),(0,0,0,0,2),(0,0,0,0,3),(0,0,0,0,4),(0,0,0,0,100)],Result),
    write(Result).





