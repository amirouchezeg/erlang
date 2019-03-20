-module(consprod).
-export([init/0]).

init()-> 
      Prod1 = spawn(producteur,start,[]),
      Prod2= spawn(producteur,start,[]),
      Cons1 = spawn(consommateur,start,[Prod1,1]),
      Cons2 = spawn(consommateur,start,[Prod1,2]),
      Cons3 = spawn(consommateur,start,[Prod2,3]),
      Cons4 = spawn(consommateur,start,[Prod2,4]).

