-module(pontvoiture).
-export([init/0]).

init()-> 

      Pont = spawn(pont,passagePont,[0,0,0]),
      % 1 sud
      % 2 nord
      spawn(voiture,loop,[Pont,1,11,0]),
      spawn(voiture,loop,[Pont,1,22,0]),
      spawn(voiture,loop,[Pont,1,1,0]),
      spawn(voiture,loop,[Pont,1,2,0]),
      spawn(voiture,loop,[Pont,1,33,0]),
      spawn(voiture,loop,[Pont,1,3,0]),
      spawn(voiture,loop,[Pont,1,4,0]),
      spawn(voiture,loop,[Pont,1,2,0]),
      spawn(voiture,loop,[Pont,1,33,0]),
      spawn(voiture,loop,[Pont,1,3,0]),
      spawn(voiture,loop,[Pont,1,4,0]),
      spawn(voiture,loop,[Pont,1,44,0]).