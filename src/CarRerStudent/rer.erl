%%%-------------------------------------------------------------------
%%% @author amirouche
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. Mar 2019 06:00 م
%%%-------------------------------------------------------------------
-module(rer).
-author("amirouche").

%% API
-export([attend/1]).


attend(N) ->
  receive
    {Car,{car_arrive}}-> ok,
      P=N+1,
      if
        P < 3 ->
          attend(P);
        true ->
          io:format("Le RER est plain ~n",[]),
          sleep(3000),
          io:format("Un RER est arriver a l amphi ~n",[])
      end
  end.

sleep(T) ->
  receive
  after T ->
    true
  end.

