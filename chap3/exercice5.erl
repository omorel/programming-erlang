-module (exercice5).
-export ([filter/2, 
          test_filter/0, 
          reverse/1, 
          test_reverse/0, 
          concatenate/1, 
          test_concatenate/0, 
          flatten/1, 
          test_flatten/0]).


filter([], _Value) -> 
	[]; 
filter([H|T], Value) when H > Value ->
	filter(T, Value); 
filter([H|T], Value) -> 
	[H|filter(T, Value)]. 	
  

reverse([]) -> 
	[]; 
reverse([H|T]) -> 
	reverse(T) ++ [H].

concatenate_helper([]) -> 	
	[];
concatenate_helper([H|T]) -> 
	[H] ++ concatenate_helper(T).

concatenate([]) -> 
	[]; 
concatenate([H|T]) -> 
	concatenate_helper(H) ++ concatenate(T). 


flatten([]) -> 
	[];
flatten([H|T]) -> 
	flatten(H) ++ flatten(T);
flatten(H) -> 
	[H]. 

test_filter() -> 
	Result = filter([1,2,3,4,5], 3),
	io:fwrite("Result: ~p~n", [Result]).

test_reverse() -> 
	Result = reverse([1,2,3]), 
	io:fwrite("Result: ~p~n", [Result]).

test_concatenate() -> 
	Result = concatenate([[1,2,3],[],[4, five]]),
	io:fwrite("Result: ~p~n", [Result]).

test_flatten() -> 
	Result = flatten([[1,[2,[3],[]]],[[[4]]],[5,6]]),
	io:fwrite("Result: ~p~n", [Result]).