-module(emo).
-export([start/1,stop/0,put_emo/2,get_emo/1,get_by_date/2,custodian/0]).

%% Emo server v1.4

start([{drop_interval,DrTime}]) ->
	ok = timer:start(),
	{ok, _} = timer:apply_interval(DrTime*1000, emo, custodian, []),
	persons = ets:new(persons,[set,public,named_table]);
start(_) ->
	io:format("Wrong arguments.~nUse ~p:start([{drop_interval,Sec}])~n", [?MODULE]).

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
			no_tuple_found;
		[{_,Status,_}] -> 
			binary_to_list(Status)
	end.

get_by_date(DateFrom, DateTo) ->
	FromSec = calendar:datetime_to_gregorian_seconds(DateFrom),
	ToSec = calendar:datetime_to_gregorian_seconds(DateTo),
	get_by_date(ets:first(persons), FromSec, ToSec, []).

get_by_date('$end_of_table',_,_,Acc) ->
	{ok, Acc};
get_by_date(Name, FromSec, ToSec, Acc) ->
	[{_, Status, Exp}] = ets:lookup(persons, Name),
	if
		Exp >= FromSec,	Exp =< ToSec ->
			get_by_date(ets:next(persons,Name),FromSec,ToSec,[{binary_to_list(Name), binary_to_list(Status)}|Acc]);
		true -> 
			get_by_date(ets:next(persons,Name),FromSec,ToSec,Acc)
	end.

custodian() ->
	CTime = calendar:datetime_to_gregorian_seconds({date(), time()}),
	io:format("Current time in seconds: ~p~n",[CTime]),
	custodian(ets:first(persons),CTime).

custodian('$end_of_table',_) ->
	clear_table_done;
custodian(Name,CTime) ->
	io:format("Current time in seconds: ~p Name: ~p~n",[CTime,Name]),
	NextName = ets:next(persons, Name),
	[{_,_,Exp}] = ets:lookup(persons,Name),
		if
		   	CTime > Exp ->
				ets:delete(persons,Name);
			true -> true
				
		end,
	custodian(NextName,CTime).


-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

start_test() -> [
				 ?_assert(start({derop_interval,10}) =:= persons)
				].

custodian_test() -> [
				 ?_assert(custodian() =:= clear_table_done)
				].

put_emo_test() -> [
				 ?_assert(put_emo({"Homer",":-)"},20) =:= true),
				 ?_assert(put_emo({"Moe",":-|"},20) =:= true)
				].

get_emo_test() -> [
				 ?_assert(get_emo("Homer") =:= ":-)"),
				 ?_assert(get_emo("Moe") =:= ":-|")
				].
get_by_date_test() -> [
				 ?_assert(get_by_date({date(), time()}, calendar:gregorian_seconds_to_datetime(calendar:datetime_to_gregorian_seconds({date(), time()}) + 30)) =:= {ok, [{"Homer",":-)"},{"Moe",":-|"}]})
				].
stop_test() -> [
				 ?_assert(stop() =:= true)
				].

-endif.
