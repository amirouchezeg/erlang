%%%-------------------------------------------------------------------
%%% @author amirouche
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. Feb 2019 11:51 ص
%%%-------------------------------------------------------------------
-module(cours0).
-author("amirouche").
-export([loop/0]).

loop() ->
  receive
      {rectangle, Width, Ht} ->
        io:format("Area of rectangle is ~p~n",[Width * Ht]),
        loop();
      {circal, Width} ->
        io:format("Area of circal is ~p~n",[Width*2]),
        loop();
      {square, Side} ->
        io:format("Area of square is ~p~n", [Side * Side]),
        loop()
  end.
