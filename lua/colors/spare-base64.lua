-- clarity

local C = require("hl-group").hl_group

function C.terminal_color()
  vim.g.terminal_color_0 = C.bg
  vim.g.terminal_color_1 = C.red
  vim.g.terminal_color_2 = C.green
  vim.g.terminal_color_3 = C.yellow
  vim.g.terminal_color_4 = C.blue
  vim.g.terminal_color_5 = C.violet
  vim.g.terminal_color_6 = C.cyan
  vim.g.terminal_color_7 = C.bg1
  vim.g.terminal_color_8 = C.brown
  vim.g.terminal_color_9 = C.red
  vim.g.terminal_color_10 = C.green
  vim.g.terminal_color_11 = C.yellow
  vim.g.terminal_color_12 = C.blue
  vim.g.terminal_color_13 = C.violet
  vim.g.terminal_color_14 = C.cyan
  vim.g.terminal_color_15 = C.fg
end

local syntax = {
  SignColumn = { fg = C.fg, bg = C.bg },
  Normal = { fg = C.fg, bg = C.bg },
  Terminal = { fg = C.fg, bg = C.bg },
  NormalFloat = { fg = C.fg, bg = C.bg },
  Number = { fg = C.orange, bg = C.bg },
  LineNr = { fg = C.grey, bg = C.bg },
  MatchParen = { fg = C.white, bg = C.bg },
  CursorLine = { bg = C.cursor },
  Cursor = { reverse = true },
  iCursor = { reverse = true },
  vCursor = { reverse = true },
  nCursor = { reverse = true },
  CursorLineNr = { fg = C.violet },
  Nontext = { fg = C.nontext, bg = C.nontext },
  Error = { fg = C.red, bg = C.bg },
  Todo = { fg = C.yellow, bg = C.bg },

  -- syntax
  ---@type table orange
  Boolean = { fg = C.orange, bg = C.bg },
  Structure = { fg = C.orange },
  Constant = { fg = C.orange },
  Exception = { fg = C.orange },
  Macro = { fg = C.orange },

  ---@type table green
  String = { fg = C.green, bg = C.bg },
  Special = { fg = C.green },
  SpecialChar = { fg = C.green },
  Operator = { fg = C.green },

  ---@type table violet
  Visual = { bg = C.visual },
  PreProc = { fg = C.violet, bg = C.bg },
  Include = { fg = C.violet, bg = C.bg },
  Define = { fg = C.violet, bg = C.bg },
  PreCondit = { fg = C.violet, bg = C.bg },
  Function = { fg = C.violet },
  CurSearch = { bg = "#606798" },
  Search = { fg = C.white, bg = "#009999" },

  ---@type table others
  Identifier = { fg = C.white },
  ---@type table red
  ErrorMsg = { fg = C.red, bg = C.bg },
  ---@type table grape
  Title = { fg = C.grape, bg = C.bg },
  ---@type table strawberry
  Statement = { fg = C.strawberry },
  ---@type table grey
  Comment = { fg = C.grey },
  ---@type table yellow
  WarningMsg = { fg = C.yellow, bg = C.bg },
  ---@type table white
  Keyword = { fg = C.white },
  ---@type table teal
  Type = { fg = C.teal },

  -- markdown
  markdownH1 = { fg = C.red, bg = C.bg },
  markdownH2 = { fg = C.orange, bg = C.bg },
  markdownH3 = { fg = C.yellow, bg = C.bg },
  markdownH4 = { fg = C.green, bg = C.bg },
  markdownH5 = { fg = C.blue, bg = C.bg },
  markdownH6 = { fg = C.violet, bg = C.bg },

  -- -- html
  -- htmlH1 = { fg = C.red, bg = C.bg },
  -- htmlH2 = { fg = C.orange, bg = C.bg },
  -- htmlH3 = { fg = C.yellow, bg = C.bg },
  -- htmlH4 = { fg = C.green, bg = C.bg },
  -- htmlH5 = { fg = C.blue, bg = C.bg },
}

local plugin_syntax = {
  -- treesitter
  ["@function"] = { fg = C.purple },
  ["@function.builtin"] = { fg = C.orange },

  -- neovim-lspconfig
  DiagnosticError = { fg = C.red },
  DiagnosticWarn = { fg = C.yellow },
  DiagnosticHint = { fg = C.blue },
  DiagnosticInfo = { fg = C.green },

  -- lazy.nvim
  LazyButton = { fg = C.white, bg = C.bg },
  LazyButtonActive = { fg = C.violet, bg = C.bg },
  LazyH1 = { fg = C.grape, bg = C.visual },
  LazyH2 = { fg = C.teal, bg = C.bg },
  LazyCommitType = { fg = C.teal, bg = C.bg },
  LazyCommitIssue = { fg = C.red, bg = C.bg },
  LazyDir = { fg = C.red, bg = C.bg },
  LazyUrl = { fg = C.red, bg = C.bg },
  LazyProp = { fg = C.violet, bg = C.bg },
  LazyLocal = { fg = C.violet, bg = C.bg },
  LazySource = { fg = C.violet, bg = C.bg },
  LazyComment = { fg = C.violet, bg = C.bg },
  LazySpecial = { fg = C.violet, bg = C.bg },
  LazyTaskOutput = { fg = C.grey, bg = C.bg },
  LazyCommit = { fg = C.white, bg = C.bg },
  LazyDimmed = { fg = C.white, bg = C.bg },
  LazyValue = { fg = C.orange, bg = C.bg },
  LazyReasonSource = { fg = C.orange, bg = C.bg },
  LazyCommitScope = { fg = C.violet, bg = C.bg },
  LazyReasonEvent = { fg = C.blue, bg = C.bg },
  LazyReasonCmd = { fg = C.orange, bg = C.bg },
  LazyReasonFt = { fg = C.teal, bg = C.bg },
  LazyReasonImport = { fg = C.red, bg = C.bg },
  LazyReasonKeys = { fg = C.green, bg = C.bg },
  LazyReasonStart = { fg = C.violet, bg = C.bg },

  -- health check
  healthError = { fg = "red", bg = C.bg },
  healthWarning = { fg = "yellow", bg = C.bg },
  healthSuccess = { fg = "green", bg = C.bg},

  -- nvim-lspconfig
}

--  Author: Glepnir
--  License: MIT

local async_load_plugin

local set_hl = function(tbl)
  for group, conf in pairs(tbl) do
    vim.api.nvim_set_hl(0, group, conf)
  end
end

async_load_plugin = vim.loop.new_async(vim.schedule_wrap(function()
  C.terminal_color()
  set_hl(plugin_syntax)
  async_load_plugin:close()
end))

function C.colorscheme()
  vim.api.nvim_command("hi clear")

  vim.o.background = "dark"
  vim.o.termguicolors = true
  vim.g.colors_name = "spare-base64"
  set_hl(syntax)
  async_load_plugin:send()
end

C.colorscheme()

return C
-- "return" @keyword.return
-- @text.literal      Comment
-- @text.reference    Identifier
-- @text.title        Title
-- @text.uri          Underlined
-- @text.underline    Underlined
-- @text.todo         Todo
--
-- @comment           Comment
-- @punctuation       Delimiter
--
-- @constant          Constant
-- @constant.builtin  Special
-- @constant.macro    Define
-- @define            Define
-- @macro             Macro
-- @string            String
-- @string.escape     SpecialChar
-- @string.special    SpecialChar
-- @character         Character
-- @character.special SpecialChar
-- @number            Number
-- @boolean           Boolean
-- @float             Float
--
-- @function          Function
-- @function.builtin  Special
-- @function.macro    Macro
-- @parameter         Identifier
-- @method            Function
-- @field             Identifier
-- @property          Identifier
-- @constructor       Special
--
-- @conditional       Conditional
-- @repeat            Repeat
-- @label             Label
-- @operator          Operator
-- @keyword           Keyword
-- @exception         Exception
--
-- @variable          Identifier
-- @type              Type
-- @type.definition   Typedef
-- @storageclass      StorageClass
-- @structure         Structure
-- @namespace         Identifier
-- @include           Include
-- @preproc           PreProc
-- @debug             Debug
-- @tag               Tag
