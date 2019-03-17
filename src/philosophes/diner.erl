-module(diner).
-export([init/0]).

init() ->
      Chop1 = spawn(chopstick,free,[]),
      Chop2 = spawn(chopstick,free,[]),
      Chop3 = spawn(chopstick,free,[]),
      Chop4 = spawn(chopstick,free,[]),
      Chop5 = spawn(chopstick,free,[]),
      Philo1 = spawn(philosophe,loop,[Chop1,Chop2,1]),
      Philo2 = spawn(philosophe,loop,[Chop2,Chop3,2]),
      Philo3 = spawn(philosophe,loop,[Chop3,Chop4,3]),
      Philo4 = spawn(philosophe,loop,[Chop4,Chop5,4]),
      Philo5 = spawn(philosophe,loop,[Chop5,Chop1,5]).




