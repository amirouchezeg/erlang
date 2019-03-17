%%%-------------------------------------------------------------------
%%% @author amirouche
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. Mar 2019 05:12 م
%%%-------------------------------------------------------------------
-module(main).
-author("amirouche").

%% API
-export([init/0]).

init() ->
  Rer  = spawn(rer,attend,[0]),
  Car1 = spawn(car,attend,[0,"Tigery",Rer]),
  Car2 = spawn(car,attend,[0,"Reao",Rer]),
  Car3 = spawn(car,attend,[0,"Soignolles",Rer]),
  spawn(student,monter,[Car1]),
  spawn(student,monter,[Car2]),
  spawn(student,monter,[Car3]),

  spawn(student,monter,[Car1]),
  spawn(student,monter,[Car2]),
  spawn(student,monter,[Car3]),
  spawn(student,monter,[Car1]),
  spawn(student,monter,[Car2]),
  spawn(student,monter,[Car3]),

  spawn(student,monter,[Car1]),
  spawn(student,monter,[Car2]),
  spawn(student,monter,[Car3]).



