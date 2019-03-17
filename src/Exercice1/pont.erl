%%%-------------------------------------------------------------------
%%% @author amirouche
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. Mar 2019 11:47 ص
%%%-------------------------------------------------------------------
-module(pont).
-author("amirouche").

%% API
-export([checkSud/2]).
checkSud(Sud, Nord, N) ->
  if
    N>3 -> checkNord(Nord, Sud, 0);
    true ->
      Sud!{self(),{ouiOuNon}},
      receive
        if
          {Sud,{oui}}-> passer(N+1)
        true ->
        end
      end.
  end

checkNord(Nord, Sud, N) ->
  %sleep
  if
    N>3 -> checkSud(Sud, Nord, 0);
    true ->
      Nord!{self(),{ouiOuNon}},
      receive
        if
          n<3 -> passer(N+1);
          true ->
        end
      end.
  end.
passer(N)->
  if
    N<4 -> io:format("La voiture sur le pont",[]);
    true ->passer(N)
  end.
