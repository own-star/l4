{application, l4, [
	{description, "New project"},
	{vsn, "0.0.1"},
	{modules, ['l4_app','l4_sup']},
	{registered, [l4_sup]},
	{applications, [kernel,stdlib]},
	{mod, {l4_app, []}}
]}.