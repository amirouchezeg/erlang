%%%-------------------------------------------------------------------
%%% @author amirouche
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. Mar 2019 11:47 ص
%%%-------------------------------------------------------------------
-module(pont).
-author("saad").
-author("amirouche").

%% API
-export([agent/3]).

agent(CountN,CountS,Dir)->
  if
    Dir == 0 ->
      if
        CountN < 4 ->
          receive
            {Voiture,{traversir_de_nord}}-> ok,
            CountNn=CountN+1,
            traverse(CountNn,0,0,Voiture)
          after 1000 ->
            if
              CountS == 4 ->
                CountSs=CountS - 1,
                agent(CountN,CountSs,1);
              true ->
                agent(CountN,CountS,1)
            end
          end;
        true ->
          agent(CountN,CountS,1)
      end;
    true ->
      if
        CountS < 4 ->
          receive
            {Voiture,{traversir_de_sud}}-> ok,
              CountSs=CountS+1,
              traverse(0,CountSs,1,Voiture)
          after 1000 ->
            if
              CountN == 4 ->
                CountNn=CountN - 1,
                agent(CountNn,CountS,0);
            true ->
              agent(CountN,CountS,0)
            end
          end;
        true ->
          agent(CountN,CountS,0)
      end
  end
.

traverse(CountN,CountS,Dir,Voiture) ->
  Voiture!{self(),{traversir}},
  agent(CountN,CountS,Dir)
.