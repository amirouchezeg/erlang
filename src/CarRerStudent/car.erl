%%%-------------------------------------------------------------------
%%% @author amirouche
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. Mar 2019 05:31 م
%%%-------------------------------------------------------------------
-module(car).
-author("saad").
-author("amirouche").

%% API
-export([attend/3]).


attend(N,Id,RER) ->
  receive
    {Student,{monter}}-> ok,
    P=N+1,
    if
       P < 4 ->
         sleep(rand:uniform(3000)),
         attend(P,Id,RER);
       true ->
         io:format("Le Car de ~p est plain ~n",[Id]),
         demarer(RER , Id)
    end
  end.

demarer(RER,Id)->
  sleep(2000),
  io:format("Un Car de ~p est arriver a Lieusaint  ~n",[Id]),
  RER!{self(),{car_arrive}},
  sleep(1000),
  attend(0,Id,RER)
  .

sleep(T) ->
  receive
  after T ->
    true
  end.