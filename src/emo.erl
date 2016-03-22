-module(emo).
-export([start/1,stop/0,put_emo/2,get_emo/1,custodian/0]).

%% Emo server v1.4

start([{drop_interval,DrTime}]) ->
	ok = timer:start(),
	{ok, _} = timer:apply_interval(DrTime*1000, emo, custodian, []),
	persons = ets:new(persons,[set,public,named_table]).

stop() -> 
	custodian(),
	ets:delete(persons).

put_emo({Name,Status},Time) ->
	CTime = calendar:datetime_to_gregorian_seconds({date(), time()}),
	ets:insert(persons,{list_to_binary(Name),list_to_binary(Status),CTime+Time}).

get_emo(Name) ->
	BName = list_to_binary(Name),
	CTime = calendar:datetime_to_gregorian_seconds({date(), time()}),
	case ets:lookup(persons,BName) of 
		[] -> 
			no_tuple_found;
		[{_,_,Exp}] when CTime > Exp -> 
			ets:delete(persons,BName),
			no_tuple_found;
		[{_,Status,_}] -> 
			binary_to_list(Status)
	end.


custodian() ->
	CTime = calendar:datetime_to_gregorian_seconds({date(), time()}),
%	FKey = ets:first(persons),
%	io:format("Key: ~p Current time in seconds: ~p~n",[FKey,CTime]),
	io:format("Key: Current time in seconds: ~p~n",[CTime]),
	custodian(ets:first(persons),CTime).

custodian('$end_of_table',_) ->
	clear_table_done;
custodian(Key,CTime) ->
	io:format("Current time in seconds: ~p Key: ~p~n",[CTime,Key]),
	NKey = ets:next(persons, Key),
	[{_,_,Exp}] = ets:lookup(persons,Key),
		if
		   	CTime > Exp ->
				ets:delete(persons,Key);
			true -> true
				
		end,
	custodian(NKey,CTime).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

start_test() -> [
				 ?_assert(start({derop_interval,10}) =:= persons)
				].

put_emo_test() -> [
				 ?_assert(put_emo({"Homer",":-)"},20) =:= true),
				 ?_assert(put_emo({"Moe",":-|"},20) =:= true)
				].

get_emo_test() -> [
				 ?_assert(get_emo("Homer") =:= ":-)"),
				 ?_assert(get_emo("Moe") =:= ":-|")
				].

stop_test() -> [
				 ?_assert(stop() =:= true)
				].

-endif.
