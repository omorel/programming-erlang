-module(demo). 
-export([double/1]). 

% Comment example

times(X, Y) -> 
	X * Y. 
	
double(Value) -> 
	times(Value, 2).

