-module(pont).
-export([passagePont/3]).

passagePont(Direction,IncrSud,IncrNord) ->
    receive
        {Voiture,{askSud}} -> 
            case Direction of
                0 -> 
                    Voiture!{self(),{entreeSud}},
                    sleep(1000),
                    passagePont(1,1,IncrNord);
                1 ->            
                    if (IncrSud < 4) ->
                        Voiture!{self(),{entreeSud}},
                        IncrS = IncrSud+1,
                        if(IncrS == 4) and (IncrNord==4)-> 
                            IncrN = IncrNord - 4,
                            sleep(1000),
                            passagePont(1,IncrS,IncrN);
                        true ->
                            sleep(1000),
                            passagePont(1,IncrS,IncrNord)
                        end;
                    true ->
                        Voiture!{self(),{entreeSudNon}},
                        sleep(1000),
                        passagePont(2,IncrSud,IncrNord)                        
                    end;
                2 ->            
                    if (IncrNord >= 4) ->
                        Voiture!{self(),{entreeSud}},
                        IncrS = IncrSud+1,
                        if(IncrS == 4) and (IncrNord==4)-> 
                            IncrN = IncrNord - 4,
                            sleep(1000),
                            passagePont(1,IncrS,IncrN);
                        true ->
                            sleep(1000),
                            passagePont(1,IncrS,IncrNord)
                        end;
                    true ->
                        Voiture!{self(),{entreeSudNon}},
                        sleep(1000),
                        passagePont(2,IncrSud,IncrNord)                        
                    end
            end;
    
        {Voiture,{askNord}} -> 
            case Direction of
                0 -> 
                    Voiture!{self(),{entreeNord}},
                    sleep(1000),
                    passagePont(2,IncrSud,1);
                2 ->            
                    if (IncrNord < 4) ->
                        Voiture!{self(),{entreeNord}},
                        IncrN = IncrNord + 1,
                        if(IncrN == 4) and (IncrSud==4)-> 
                            IncrS = IncrSud - 4,
                            sleep(1000),
                            passagePont(2,IncrS,IncrN);
                        true ->
                            sleep(1000),
                            passagePont(2,IncrSud,IncrN)
                        end;
                    true ->
                        Voiture!{self(),{entreeNordNon}},
                        sleep(1000),
                        passagePont(1,IncrSud,IncrNord)   
                                       
                    end;
                1 ->            
                    if (IncrSud >= 4) ->
                        Voiture!{self(),{entreeNord}},
                        IncrN = IncrNord + 1,
                        if(IncrN == 4) and (IncrSud==4)-> 
                            IncrS = IncrSud - 4,
                            sleep(1000),
                            passagePont(2,IncrS,IncrN);
                        true ->
                            sleep(1000),
                            passagePont(2,IncrSud,IncrN)
                        end;
                    true ->
                        Voiture!{self(),{entreeNordNon}},
                        sleep(1000),
                        passagePont(1,IncrSud,IncrNord)                        
                    end
            end
    end.

sleep(T) ->
	receive
	after T ->
		true
	end.
 