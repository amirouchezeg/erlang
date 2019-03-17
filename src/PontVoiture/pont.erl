%%%-------------------------------------------------------------------
%%% @author amirouche
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. Mar 2019 11:47 ص
%%%-------------------------------------------------------------------
-module(pont).
-author("amirouche").

%% API
-export([agent/4]).

agent(N,S,Nord,Sud)->
  receive
      {Voiture,{passer} , Dir}-> ok,
        if
          Dir ==1 ->
              S=0,
              Nn=N+1,
              if
                Nn < 4 ->
                  Nord!{self(),Voiture,Nn};
                true ->
                  N=0
              end,
              agent(Nn,S);
          true ->
              N=0,
              Ss=S+1,
              if
                Ss < 4 ->
                  Sud!{self(),{Voiture}}
              end,
              agent(N,Ss)
        end
end.

passerN(Voiture)->
  Voiture!{self(),{passer}}
.

passerS(Voiture)->
  Voiture!{self(),{passer}}
.