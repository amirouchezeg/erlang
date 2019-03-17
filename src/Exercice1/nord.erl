%%%-------------------------------------------------------------------
%%% @author amirouche
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. Mar 2019 11:47 ص
%%%-------------------------------------------------------------------
-module(nord).
-author("amirouche").

%% API
-export([list/1]).
list(Pont) ->
  receive
    if
      {Voiture,{passer}}->
        Pont!{self(), oui};
      true ->
        {Pont,{ya}},
        Pont!{self(),{oui}}
    end
  end.
oui(Voiture, Pont) ->
  {Pont,{?}},
   Pont!{self(),{oui}}
