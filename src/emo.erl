-module(emo).
-export([start/0,stop/0,put/3,get/1]).

start() ->
	persons = ets:new(persons,[set,public,named_table]).

stop() -> 
	ets:delete(persons).

put(Name,Status,Time) ->
	CTime = calendar:datetime_to_gregorian_seconds({date(), time()}),
	ets:insert(persons,{Name,Status,CTime+Time}).

get(Name) ->
	CTime = calendar:datetime_to_gregorian_seconds({date(), time()}),
	case ets:lookup(persons,Name) of 
		[] -> 
			"No tuple found";
		[{_,_,Exp}] when CTime > Exp -> 
			ets:delete(persons,Name),
			"No tuple found";
		[{_,Status,_}] -> 
			Status
	end.
