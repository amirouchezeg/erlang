%%%-------------------------------------------------------------------
%%% @author amirouche
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. Feb 2019 09:13 م
%%%-------------------------------------------------------------------
-module(tut).
-author("amirouche").

%% API
-export([rec/0,env/1]).
%%%%%%%%send and receive
rec()->
  receive
    {tuto,Sender} ->
        io:fwrite("Hello tuto\n", [self()]),
        Sender!{titi};
    _Any-> io:fwrite("Auther\n")
  end,
  timer:sleep(5000),
  rec().
env(Pid)->
  spawn(tut,env,[Pid]),
  Pid!{toto,self()},
  receive
    {titi} ->
      io:fwrite("Proc ~ p a recu le message ~n \n", [self()])
  end.

efface()->
  receive
    _Any-> efface()
  end.
%Proc= spawn(tut,rec,[]).  %to create prossec
%Proc!{tuto}. %to send message
%Proc!{tuto,self()}. %to send message %self() c'est moi qui envoyé
%%%%%%%%send and receive %%%%%end



