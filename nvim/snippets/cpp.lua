return {

	s({ trig = "cppt", snippetType = "autosnippet" }, {
		t({
			"#include <bits/stdc++.h>",
			"using namespace std;",
			"",
			"int main() {",
			"    ",
		}),
		i(0), -- This is where your cursor will be after expanding
		t({
			"",
			"",
			"    return 0;",
			"}",
		}),
	}),
}
