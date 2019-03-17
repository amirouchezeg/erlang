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

loop(0,Car) ->
  D=0;
loop(Count,Car) ->
  spawn(student,monter,[Car]),
  loop(Count-1,Car).

init() ->
  Rer  = spawn(rer,attend,[0]),
  Car1 = spawn(car,attend,[0,"Tigery",Rer]),
  Car2 = spawn(car,attend,[0,"Reao",Rer]),
  Car3 = spawn(car,attend,[0,"Soignolles",Rer]),

  loop(50,Car1),
  loop(44,Car2),
  loop(44,Car3)
.


