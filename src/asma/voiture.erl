-module(voiture).
-export([loop/4]).

loop(Pont,D,Id,Passe) ->
    case D of
        1 -> 
            if(Passe==0) ->
                Pont!{self(),{askSud}},
                receive
                    {Pont,{entreeSud}}->
                        io:format("Sud ~p passe ~n",[Id]),
                        sleep(1000),
                        loop(Pont,D,Id,1);
                    
                    {Pont,{entreeSudNon}}->
                        io:format("Sud ~p attend ~n",[Id]),
                        sleep(1000),
                        loop(Pont,D,Id,0)
                end;

            true ->
                Pont!{self(),{askSud}},
                receive
                    {Pont,{entreeSud}}->
                        io:format("Sud ~p passe revient ~n",[Id]),
                        sleep(1000),
                        loop(Pont,D,Id,1);

                    {Pont,{entreeSudNon}}->
                        io:format("Sud ~p attend revient ~n",[Id]),
                        sleep(1000),
                        loop(Pont,D,Id,0)
                        
                end
            end;

        2 -> 
            if(Passe==0) ->
                Pont!{self(),{askNord}},
                receive
                    {Pont,{entreeNord}}->
                        io:format("Nord ~p passe ~n",[Id]),
                        sleep(1000),
                        loop(Pont,D,Id,1);
                    
                    {Pont,{entreeNordNon}}->
                        io:format("Nord ~p attend ~n",[Id]),
                        sleep(1000),
                        loop(Pont,D,Id,0)
                end;

            true ->
                Pont!{self(),{askNord}},
                receive
                    {Pont,{entreeNord}}->
                        io:format("Nord ~p passe revient ~n",[Id]),
                        sleep(1000),
                        loop(Pont,D,Id,1);

                    {Pont,{entreeNordNon}}->
                        io:format("Nord ~p attend revient ~n",[Id]),
                        sleep(1000),
                        loop(Pont,D,Id,0)
                    
                end
            end
        end
.

sleep(T) ->
	receive
	after T ->
		true
	end.
