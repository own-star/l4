-module(time_server).
-export(start/1).

%% v1.6

start(DrTime) ->
	ok = timer:start(),
	{ok, TRef} = timer:apply_interval(DrTime*1000, emo, custodian, []),
	timer = ets:new(timer,[set,public,named_table]),
	ets:insert(timer,{timer,TRef}),
	process_loop(TRef).

process_loop(TRef) ->
	receive
		stop ->
			timer:cancel(TRef)
	end.
