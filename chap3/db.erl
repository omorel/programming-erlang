-module (db).
-export ([new/0, 
          destroy/1, 
          write/3, 
          delete/2, 
          read/2, 
          match/2, 
          test_db/0]).


new() -> 
	[]. 

destroy(_Db) -> 
	ok. 
	
write(Key, Element, [{Key, _Value}|T]) -> 
	[{Key, Element}|T]; 
write(Key, Element, []) -> 
	[{Key, Element}];
write(Key, Element, [H|T]) -> 
    [H|write(Key, Element, T)]. 
	
delete(Key, [{Key, _Value}|T]) -> 
 	T;
delete(Key, [H|T]) -> 
	[H|delete(Key, T)]; 
delete(_Key, []) -> 
	[]. 

read(Key, [{Key, Element}|_T]) -> 
	{ok, Element}; 
read(_Key, []) ->
	{error, instance}; 
read(Key, [_H|T]) ->
	read(Key, T).

match(Element, Db) -> 
	match_acc(Element, [], Db). 
	
match_acc(Element, Matches, [{Key, Element}|T]) -> 
	match_acc(Element, [Key|Matches], T); 
match_acc(_Element, Matches, []) ->
	Matches; 
match_acc(Element, Matches, [_H|T]) ->
	match_acc(Element, Matches, T). 


test_db() -> 
	Db = new(), 
	io:fwrite("Db = ~p~n", [Db]),
	Db1 = write(francesco, london, Db),  
	io:fwrite("Db1 = ~p~n", [Db1]),
	Db2 = write(lelle, stockholm, Db1), 
	io:fwrite("Db2 = ~p~n", [Db2]),
	Read1 = read(francesco, Db2),
	io:fwrite("Read = ~p~n", [Read1]), 
	Db3 = write(joern, stockholm, Db2),
	io:fwrite("Db3 = ~p~n", [Db3]),
	Read2 = read(ola, Db3), 
	io:fwrite("Read2 = ~p~n", [Read2]),
	Match1 = match(stockholm, Db3), 
	io:fwrite("Match1 = ~p~n", [Match1]),
	Db4 = delete(lelle, Db3),
	io:fwrite("Db4 = ~p~n", [Db4]), 
	Match2 = match(stockholm, Db4),
	io:fwrite("Match2 = ~p~n", [Match2]).