-module(philosophe).
-export([loop/3]).

loop(Left,Right,Id) ->
        sleep(rand:uniform(500)),
        Left!{self(),{pick}},
        receive
            {Left,{ok}}-> ok
        end,
        io:format("Philosophe ~p a pris la baguette gauche ~n",[Id]),  
        sleep(rand:uniform(3000)),
        Right!{self(),{pick}},
        receive
            {Right,{ok}}-> ok
        end,
        io:format("Philosophe ~p mange ~n",[Id]),
        sleep(rand:uniform(500)),
        Right!{self(),{drop}},     
        Left!{self(),{drop}},        
        loop(Left,Right,Id).

sleep(T) ->
	receive
	after T ->
		true
	end.