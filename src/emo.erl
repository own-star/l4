-module(emo).
-export([start/0,stop/0,put_emo/2,get_emo/1]).

%% Emo server v1.3

start() ->
	persons = ets:new(persons,[set,public,named_table]).

stop() -> 
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

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

start_test() -> [
				 ?_assert(start() =:= persons)
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
