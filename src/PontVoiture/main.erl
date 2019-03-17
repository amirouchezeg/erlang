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
  %to make 3 pass together
  Nord= spawn(nord,arrive,[0]),
  Sud= spawn(sud,arrive,[0]),
  spawn(voiture,traverser,[Nord,Sud,"Nord",1]),
  spawn(voiture,traverser,[Nord,Sud,"Nord",2]),
  spawn(voiture,traverser,[Nord,Sud,"Nord",3]),
  spawn(voiture,traverser,[Sud,Nord,"Sud" ,4]),
  spawn(voiture,traverser,[Nord,Sud,"Nord",5]),
  spawn(voiture,traverser,[Nord,Sud,"Nord",6]),
  spawn(voiture,traverser,[Nord,Sud,"Nord",7]),
  spawn(voiture,traverser,[Nord,Sud,"Nord",8]),
  spawn(voiture,traverser,[Nord,Sud,"Nord",8]),
  spawn(voiture,traverser,[Sud,Nord,"Sud" ,9]).