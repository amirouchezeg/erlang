-module(chopstick).
-export([free/0]).

free() ->
      receive
         {Philo,{pick}}-> 
                Philo!{self(),{ok}},
                taken(Philo)
      end.

taken(Philo) ->
      receive
         {Philo,{drop}}-> 
                free()
      end.

