% erlang notes
-module(notes).
-export([greet/1, main/0]).

greet(Name) ->
    "hello " ++ Name.

main() ->
    io:format("~s~n", [greet("practice")]),
    Nums = [1, 2, 3],
    Doubled = lists:map(fun(N) -> N * 2 end, Nums),
    io:format("~p~n", [Doubled]).

% TODO: try processes/messages next
