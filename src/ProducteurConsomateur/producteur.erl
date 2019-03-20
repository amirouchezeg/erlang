-module(producteur).
-export([start/0]).

start() -> loop(0).

loop(N) ->
      sleep(400),
      io:format("J'ai produit la valeur ~p~n",[N]),
      
      receive
         {Consommateur,{ask}} -> 
             Consommateur!{self(),{tell,N}},
             loop(N+1);
         M -> 
             io:format("Erreur ~p~n", [M])
      end.


sleep(T) ->
	receive
	after T ->
		true
	end.
