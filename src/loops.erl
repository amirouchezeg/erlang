%%%-------------------------------------------------------------------
%%% @author amirouche
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. Feb 2019 09:02 م
%%%-------------------------------------------------------------------
-module(loops).
-author("amirouche").

%% API
-export([while/1,while/2, start/0]).

while(L) -> while(L,0).
while([], Acc) -> Acc;

while([_|T], Acc) ->
  io:fwrite("~w~n",[Acc]),
  while(T,Acc+1).

start() ->
  X = [1,2,3,4],
  while(X).