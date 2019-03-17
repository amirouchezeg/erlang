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
-export([]).

passer(Dir) ->
  Dir!{self(),{passer}}
.
