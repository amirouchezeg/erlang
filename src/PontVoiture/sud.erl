%%%-------------------------------------------------------------------
%%% @author amirouche
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. Mar 2019 11:47 ص
%%%-------------------------------------------------------------------
-module(sud).
-author("amirouche").

%% API
%% API
-export([arrive/1]).
arrive(N) ->
  receive
    {Voiture,{a_traversir},Nord}-> ok,
      Nn=N+1,
      if
        Nn >= 4 ->
          if
            Nn == 4 -> Nord ! {self(), {continue}};
            true->
              D=0
          end,
          receive
            {Nord,{continue}}-> ok,
              Voiture!{self(),{traversir}},
              arrive(0)
          end;
        true ->
          Voiture!{self(),{traversir}},
          arrive(Nn)
      end
  end.

