%%%-------------------------------------------------------------------
%%% @author amirouche
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. Mar 2019 11:46 ص
%%%-------------------------------------------------------------------
-module(voiture).
-author("amirouche").

%% API
-export([traverser/3]).
traverser(Pont,NameDirection,Id) ->
  if
    NameDirection=="Nord" ->
      Pont!{self(),{traversir_de_nord}};
    true ->
      Pont!{self(),{traversir_de_sud}}
  end,
  attend(Pont,NameDirection,Id)
.

attend(Pont,NameDirection,Id)->
  receive
      {Pont,{traversir}}-> ok,
      sleep(400),
      io:format("la voiture ~p à sorti de ~p ~n",[Id,NameDirection]),
      sleep(400),
      traverser(Pont,NameDirection,Id)
  end.

sleep(T) ->
  receive
  after T ->
    true
  end.