return {
	-- math modes
	s({ trig = "typh", snippetType = "autosnippet" },
		fmta(
			[[
			#set text(font: "GeistMono Nerd Font", size: 11pt)
			#set par(justify: true)
			#set heading(numbering: "1.1.")
			#let c = align.with(center)
			#let r = align.with(right)
			#let n = linebreak

			<content>
	]],
			{ content = i(1, "") }
		)
	)
}


