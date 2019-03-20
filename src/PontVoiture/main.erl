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
  %Nord= spawn(nord,arrive,[0]),
  %Sud= spawn(sud,arrive,[0]),

  Pont=spawn(pont,agent,[0,0,0]),
  % 0 : nord /// 1 : sud
  spawn(voiture,traverser,[Pont,"Nord",1]),
  spawn(voiture,traverser,[Pont,"Nord",2]),
  spawn(voiture,traverser,[Pont,"Nord",3]),
  spawn(voiture,traverser,[Pont,"Nord",4]),
  spawn(voiture,traverser,[Pont,"Nord",5]),
  spawn(voiture,traverser,[Pont,"Nord",6]),
  spawn(voiture,traverser,[Pont,"Nord",7]),
  spawn(voiture,traverser,[Pont,"Nord",8]),
  spawn(voiture,traverser,[Pont,"Nord",9]),
  spawn(voiture,traverser,[Pont,"Nord",10]),

  spawn(voiture,traverser,[Pont,"Sud",11]),
  spawn(voiture,traverser,[Pont,"Sud",12]),
  spawn(voiture,traverser,[Pont,"Sud",13]),
  spawn(voiture,traverser,[Pont,"Sud",14]),
  spawn(voiture,traverser,[Pont,"Sud",15]),
  spawn(voiture,traverser,[Pont,"Sud",16]),
  spawn(voiture,traverser,[Pont,"Sud",17]),
  spawn(voiture,traverser,[Pont,"Sud",18]),
  spawn(voiture,traverser,[Pont,"Sud",19]),
  spawn(voiture,traverser,[Pont,"Sud",20])

.

sleep(T) ->
  receive
  after T ->
    true
  end.