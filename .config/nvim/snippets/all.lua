-- Place this in ${HOME}/.config/nvim/LuaSnip/all.lua
local ls = require("luasnip")
local s = ls.snippet

return {
  -- A snippet that expands the trigger "hi" into the string "Hello, world!".
  require("luasnip").snippet(
    { trig = "..." },
    { t("\\cdots") }
  ),

  -- To return multiple snippets, use one `return` statement per snippet file
  -- and return a table of Lua snippets.
  require("luasnip").snippet(
    { trig = "foo" },
    { t("Another snippet.") }
  ),
	s({trig="/", dscr="Expands 'ff' into '\frac{}{}'"},
  {
    t("\\frac{"),
    i(1),  -- insert node 1
    t("}{"),
    i(2),  -- insert node 2
    t("}")
  }
),
require("luasnip").snippet(
		{trig = "lim"},
		{t("\\lim\\limits_{"),i(1),t("\\rightarrow"),i(2),t("}{"),i(3),t("}")}
),

require("luasnip").snippet(
		{trig = "int"},
		{t("\\int_{"),i(1),t("}^{"),i(2),t("}{"),i(3),t("\\ dx}")}
),

require("luasnip").snippet(
		{trig = "par"},
		{t("\\partial")}
),
s({trig="begenv", snippetType="autosnippet"},
  fmta(
    [[
      \begin{<>}
          <>
      \end{<>}
    ]],
    {
      i(1),
      i(2),
      rep(1),  -- this node repeats insert node i(1)
    }
  )
),


}

