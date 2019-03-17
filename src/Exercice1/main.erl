%%%-------------------------------------------------------------------
%%% @author amirouche
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. Mar 2019 11:48 ص
%%%-------------------------------------------------------------------
-module(main).
-author("amirouche").

%% API
-export([init/0]).

init() ->
  Pont  = spawn(pont,passe,[]),
  Sud = spawn(sud,attend,[Pont]),
  Nord = spawn(sud,attend,[Pont]),
  Voiture =spawn(voiture,passer,[Nord]),
  Voiture =spawn(voiture,passer,[Nord]),
  Voiture =spawn(voiture,passer,[Nord]),
  Voiture =spawn(voiture,passer,[Nord]),
  Voiture =spawn(voiture,passer,[Sud]).




