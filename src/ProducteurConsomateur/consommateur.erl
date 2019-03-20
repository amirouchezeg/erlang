-module(consommateur).
-export([start/2]).

start(Prod,Id)-> loop(Prod,Id).

loop(Prod,Id) ->
      case (rand:uniform(50)) of
          1-> ok;
          _->
              sleep(rand:uniform(500)),
              Prod!{self(),{ask}},
              receive
                {Prod,{tell,N}} -> 
                   io:format("Consommateur ~p a consommé la valeur ~p~n",[Id,N]),
                   loop(Prod,Id)
              end
      end.


sleep(T) ->
	receive
	after T ->
		true
	end.
