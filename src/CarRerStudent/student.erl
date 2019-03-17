%%%-------------------------------------------------------------------
%%% @author amirouche
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. Mar 2019 05:11 م
%%%-------------------------------------------------------------------
-module(student).
-author("amirouche").
-author("saad").

%% API

-export([monter/1]).

monter(Car) ->
  Car!{self(),{monter}}.


sleep(T) ->
  receive
  after T ->
    true
  end.


