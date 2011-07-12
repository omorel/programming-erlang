-module (exercices).
-export ([sum_one/1, test_sum_one/0, 
          sum_two/2, test_sum_two/0, 
      	  create/1, test_create/0, 
          reverse_create/1, test_reverse_create/0, 
		  print_integers/1, print_even_integers/1]).

sum_one(0) -> 0; 
sum_one(I) when I > 0 -> 
	I + sum_one(I-1). 
	
sum_two(N, M) when N > M -> 
	exit(non_normal_return); 
sum_two(N, N) -> N; 
sum_two(N, M) -> 
	N + sum_two(N+1, M). 

create(N) -> 
	create_acc(N-1, [N]). 
create_acc(1, List) -> 
	List; 
create_acc(N, List) -> 
	create_acc(N-1, [N | List]). 

reverse_create(N) -> 
 	reverse_create_acc(N). 
reverse_create_acc(1) -> 
	[1];
reverse_create_acc(N) -> 
	[N | reverse_create_acc(N-1)].

print_integers(1) -> 
	io:format("Number:~p~n", [1]); 
print_integers(N) -> 
	print_integers(N-1), 
	io:format("Number:~p~n", [N]). 

print_even_integers(1) -> 
	return; 
print_even_integers(N) when N rem 2 == 0 -> 
	print_even_integers(N-1), 
	io:format("Number:~p~n", [N]); 
print_even_integers(N) -> 
	print_even_integers(N-1). 	

test_sum_one() -> 
	X = sum_one(5),  
	X = 15, 
	success.
	
test_sum_two() ->
	X = sum_two(1,3), 
	Y = sum_two(6,6), 
	X = 6,
	Y = 6, 
	success.

test_create() -> 
	X = create(3), 
	X = [1,2,3], 
	success.
	
test_reverse_create() -> 
	X = reverse_create(3), 
	X = [3,2,1], 
	success.