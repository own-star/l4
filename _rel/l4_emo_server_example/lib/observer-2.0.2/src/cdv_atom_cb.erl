%%
%% %CopyrightBegin%
%%
%% Copyright Ericsson AB 2013. All Rights Reserved.
%%
%% The contents of this file are subject to the Erlang Public License,
%% Version 1.1, (the "License"); you may not use this file except in
%% compliance with the License. You should have received a copy of the
%% Erlang Public License along with this software. If not, it can be
%% retrieved online at http://www.erlang.org/.
%%
%% Software distributed under the License is distributed on an "AS IS"
%% basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
%% the License for the specific language governing rights and limitations
%% under the License.
%%
%% %CopyrightEnd%
-module(cdv_atom_cb).

-export([col_to_elem/1,
	 col_spec/0,
	 get_info/1,
	 format/1]).

-include_lib("wx/include/wx.hrl").

%% Defines
-define(COL_ID, 0).
-define(COL_ATOM, ?COL_ID+1).

%% Callbacks for cdv_virtual_list_wx
col_to_elem(id) -> col_to_elem(?COL_ID);
col_to_elem(Id) -> Id+1.

col_spec() ->
    [{"Creation order",   ?wxLIST_FORMAT_CENTER, 100},
     {"Atom",             ?wxLIST_FORMAT_LEFT,  100}].

get_info(_) ->
    {ok,Info,TW} = crashdump_viewer:atoms(),
    {Info,TW}.

format({Bin,q}) when is_binary(Bin) ->
    [$'|binary_to_list(Bin)];
format({Bin,nq}) when is_binary(Bin) ->
    lists:flatten(io_lib:format("~ts",[Bin]));
format(D) ->
    D.
