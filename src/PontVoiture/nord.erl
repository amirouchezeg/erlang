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
-export([arrive/1]).
arrive(N) ->
  receive
      {Voiture,{a_traversir},Sud}-> ok,
      Nn=N+1,
      if
        Nn > 5 ->
          if
            Nn == 4 -> Sud ! {self(), {continue}};
            true->
              D=0
          end,
          receive
            {Sud,{continue}}-> ok,
            Voiture!{self(),{traversir}},
            arrive(0)
          end;
       true ->
         Voiture!{self(),{traversir}},
         arrive(Nn)
      end
  end.