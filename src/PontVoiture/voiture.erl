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
-export([traverser/4]).
traverser(From,To,NameDirection,Id) ->
  From!{self(),{a_traversir},To},
  attend(From,To,NameDirection,Id)
.

attend(From,To,NameDirection,Id)->
  receive
      {Direction,{traversir}}-> ok,
      sleep(rand:uniform(5000)),
      io:format("la voiture ~p a traversé de ~p ~n",[Id,NameDirection]),
      sleep(rand:uniform(5000)),
      traverser(From,To,NameDirection,Id)
  end.


sleep(T) ->
  receive
  after T ->
    true
  end.