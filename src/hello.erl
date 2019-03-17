% hello world program
-module(hello).
%-export([start/0]).
%start() -> io:fwrite("~w",[1+1]).
%start() ->io:fwrite(2 =< 3).

%%%%%%%%%% Tuple
%start() ->
%  Bin1 = <<10,20>>,
%  X = binary_to_list(Bin1),
%  io:fwrite("~w",[X]).

%%%%%%%%%% Bit String
%start() ->
%  P = {john,24,{june,25}} ,
%  io:fwrite("~w",[tuple_size(P)]).

%%%%%%%%%% Map
%start() ->
%  M1 = #{name=>john,age=>25},
%  io:fwrite("~w",[map_size(M1)]).

%%%%%%%%%% List
% start() ->
%  L = [10,20,30] ,
%  io:fwrite("~w",[length(L)]).

%start() ->
% X = 40,
% Y = 50,
% Result = X + Y,
% io:fwrite("~w",[Result]).

-export([hello_world/0]).
hello_world() ->
  io:fwrite("Hello w World\n").