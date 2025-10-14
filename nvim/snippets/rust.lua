---@diagnostic disable: undefined-global

return {
	s({ trig = "dpl" },
		fmta([[println!("{:?}", <>)]],
			{
				i(1),
			})
	),
	s({ trig = "p" },
		t([[println!("{}", <>)]],
			{
				i(1),
			})
	),
}
