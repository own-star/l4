-module(emo).
-export([start/0,stop/0,put/3,get/1]).

start() ->
	persons = ets:new(persons,[set,public,named_table]).

stop() -> 
	ets:delete(persons).

put(Name,Status,Time) ->
	CTime = calendar:datetime_to_gregorian_seconds({date(), time()}),
	ets:insert(persons,{Name,Status,CTime+Time}).

%% 
get(Name) ->
	[{_,Status,Exp}] = ets:lookup(persons,Name),
	CTime = calendar:datetime_to_gregorian_seconds({date(), time()}),
	if 
		CTime > Exp -> Res = "No tuple found",
					   ets:delete(persons,Name);
		true -> Res = Status
	end,
	Res.
