-module(l4_sup).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

start_link() ->
	supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
	Procs = [{l4_emo_server, {l4_emo_server, start, [[{drop_interval,300}]]},
        permanent, 5000, worker, [l4_emo_server]}],
	{ok, {{one_for_one, 1, 5}, Procs}}.
