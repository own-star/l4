{application, l4, [
	{description, "New project"},
	{vsn, "0.0.1"},
	{modules, ['emo','l4_app','l4_emo_server','l4_sup']},
	{registered, [l4_sup]},
	{applications, [kernel,stdlib]},
	{mod, {l4_app, []}}
]}.