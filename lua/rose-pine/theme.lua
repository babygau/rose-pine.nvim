local blend = require('rose-pine.util').blend

local M = {}

function M.get(config)
  local p = require('rose-pine.palette')

  local theme = {}
  local groups = config.groups or {}
  local styles = {
    italic = not config.disable_italics,
    vert_split = (config.bold_vert_split and groups.border) or p.none,
    background = (config.disable_background and p.none)
        or groups.background,
    float_background = (config.disable_float_background and p.none)
        or groups.panel,
  }
  styles.nc_background = (config.dim_nc_background and groups.panel)
      or styles.background

  theme = {
    ColorColumn = { bg = p.overlay },
    Conceal = { bg = p.none },
    CurSearch = { link = 'IncSearch' },
    -- Cursor = {},
    CursorColumn = { bg = p.highlight_low },
    -- CursorIM = {},
    CursorLine = { bg = p.highlight_low },
    CursorLineNr = { fg = p.text },
    DarkenedPanel = { bg = groups.panel },
    DarkenedStatusline = { bg = groups.panel },
    DiffAdd = { bg = blend(groups.git_add, groups.background, 0.5) },
    DiffChange = { bg = p.overlay },
    DiffDelete = { bg = blend(groups.git_delete, groups.background, 0.5) },
    DiffText = { bg = blend(groups.git_text, groups.background, 0.5) },
    diffAdded = { link = 'DiffAdd' },
    diffChanged = { link = 'DiffChange' },
    diffRemoved = { link = 'DiffDelete' },
    Directory = { fg = p.foam, bg = p.none },
    -- EndOfBuffer = {},
    ErrorMsg = { fg = p.love, bg = p.none, bold = true },
    FloatBorder = { fg = groups.border },
    FloatTitle = { fg = p.muted },
    FoldColumn = { fg = p.muted },
    Folded = { fg = p.text, bg = groups.panel },
    IncSearch = { fg = p.base, bg = p.rose },
    LineNr = { fg = p.muted },
    MatchParen = { fg = p.text, bg = p.highlight_med },
    ModeMsg = { fg = p.subtle },
    MoreMsg = { fg = p.iris },
    NonText = { fg = p.muted },
    Normal = { fg = p.text, bg = styles.background },
    NormalFloat = { fg = p.text, bg = styles.float_background },
    NormalNC = { fg = p.text, bg = styles.nc_background },
    NvimInternalError = { fg = p.love, bg = p.none },
    Pmenu = { fg = p.subtle, bg = styles.float_background },
    PmenuSbar = { bg = p.highlight_low },
    PmenuSel = { fg = p.text, bg = p.overlay },
    PmenuThumb = { bg = p.highlight_med },
    Question = { fg = p.gold },
    -- QuickFixLine = {},
    RedrawDebugNormal = { bg = p.none },
    RedrawDebugClear = { fg = '#ffffff', bg = p.none },
    RedrawDebugComposed = { fg = '#ffffff', bg = p.none },
    RedrawDebugRecompose = { fg = '#ffffff', bg = p.none },
    Search = { bg = p.highlight_med },
    SpecialKey = { fg = p.foam },
    SpellBad = { sp = p.subtle, undercurl = true },
    SpellCap = { sp = p.subtle, undercurl = true },
    SpellLocal = { sp = p.subtle, undercurl = true },
    SpellRare = { sp = p.subtle, undercurl = true },
    SignColumn = { fg = p.text, bg = styles.background },
    StatusLine = { fg = p.subtle, bg = styles.float_background },
    StatusLineNC = { fg = p.muted, bg = styles.background },
    StatusLineTerm = { link = 'StatusLine' },
    StatusLineTermNC = { link = 'StatusLineNC' },
    TabLine = { fg = p.subtle, bg = styles.float_background },
    TabLineFill = { bg = styles.float_background },
    TabLineSel = { fg = p.text, bg = p.love },
    Title = { fg = p.text },
    VertSplit = { fg = groups.border, bg = styles.vert_split },
    Visual = { bg = p.highlight_med },
    -- VisualNOS = {},
    WarningMsg = { fg = p.gold },
    -- Whitespace = {},
    WildMenu = { link = 'IncSearch' },

    Boolean = { fg = p.rose },
    Character = { fg = p.gold },
    Comment = { fg = groups.comment, italic = styles.italic },
    Conditional = { fg = p.pine },
    Constant = { fg = p.gold },
    Debug = { fg = p.rose },
    Define = { fg = p.iris },
    Delimiter = { fg = p.subtle },
    Error = { fg = p.love, bg = p.none },
    Exception = { fg = p.pine },
    Float = { fg = p.gold },
    Function = { fg = p.rose },
    Identifier = { fg = p.rose },
    -- Ignore = {},
    Include = { fg = p.iris },
    Keyword = { fg = p.pine },
    Label = { fg = p.foam },
    Macro = { fg = p.iris },
    Number = { fg = p.gold },
    Operator = { fg = p.subtle },
    PreCondit = { fg = p.iris },
    PreProc = { fg = p.iris },
    Repeat = { fg = p.pine },
    Special = { fg = p.rose },
    SpecialChar = { fg = p.rose },
    SpecialComment = { fg = p.iris },
    Statement = { fg = p.pine },
    StorageClass = { fg = p.foam },
    String = { fg = p.gold },
    Structure = { fg = p.foam },
    Tag = { fg = p.rose },
    Todo = { fg = p.iris },
    Type = { fg = p.foam },
    Typedef = { fg = p.foam },
    Underlined = { underline = true },

    htmlArg = { fg = p.iris },
    htmlBold = { bold = true },
    htmlEndTag = { fg = p.subtle },
    htmlH1 = { fg = groups.headings.h1, bold = true },
    htmlH2 = { fg = groups.headings.h2, bold = true },
    htmlH3 = { fg = groups.headings.h3, bold = true },
    htmlH4 = { fg = groups.headings.h4, bold = true },
    htmlH5 = { fg = groups.headings.h5, bold = true },
    htmlItalic = { italic = styles.italic },
    htmlLink = { fg = groups.link },
    htmlTag = { fg = p.subtle },
    htmlTagN = { fg = p.text },
    htmlTagName = { fg = p.foam },

    markdownDelimiter = { fg = p.subtle },
    markdownH1 = { fg = groups.headings.h1, bold = true },
    markdownH1Delimiter = { link = 'markdownH1' },
    markdownH2 = { fg = groups.headings.h2, bold = true },
    markdownH2Delimiter = { link = 'markdownH2' },
    markdownH3 = { fg = groups.headings.h3, bold = true },
    markdownH3Delimiter = { link = 'markdownH3' },
    markdownH4 = { fg = groups.headings.h4, bold = true },
    markdownH4Delimiter = { link = 'markdownH4' },
    markdownH5 = { fg = groups.headings.h5, bold = true },
    markdownH5Delimiter = { link = 'markdownH5' },
    markdownH6 = { fg = groups.headings.h6, bold = true },
    markdownH6Delimiter = { link = 'markdownH6' },
    markdownLinkText = { fg = groups.link, underline = true },
    markdownUrl = { link = 'markdownLinkText' },

    mkdCode = { fg = p.foam, italic = styles.italic },
    mkdCodeDelimiter = { fg = p.rose },
    mkdCodeEnd = { fg = p.foam },
    mkdCodeStart = { fg = p.foam },
    mkdFootnotes = { fg = p.foam },
    mkdID = { fg = p.foam, underline = true },
    mkdInlineURL = { fg = groups.link, underline = true },
    mkdLink = { link = 'mkdInlineURL' },
    mkdLinkDef = { link = 'mkdInlineURL' },
    mkdListItemLine = { fg = p.text },
    mkdRule = { fg = p.subtle },
    mkdURL = { link = 'mkdInlineURL' },

    DiagnosticError = { fg = groups.error },
    DiagnosticHint = { fg = groups.hint },
    DiagnosticInfo = { fg = groups.info },
    DiagnosticWarn = { fg = groups.warn },
    DiagnosticDefaultError = { fg = groups.error },
    DiagnosticDefaultHint = { fg = groups.hint },
    DiagnosticDefaultInfo = { fg = groups.info },
    DiagnosticDefaultWarn = { fg = groups.warn },
    DiagnosticFloatingError = { fg = groups.error },
    DiagnosticFloatingHint = { fg = groups.hint },
    DiagnosticFloatingInfo = { fg = groups.info },
    DiagnosticFloatingWarn = { fg = groups.warn },
    DiagnosticSignError = { fg = groups.error },
    DiagnosticSignHint = { fg = groups.hint },
    DiagnosticSignInfo = { fg = groups.info },
    DiagnosticSignWarn = { fg = groups.warn },
    DiagnosticStatusLineError = { fg = groups.error, bg = groups.panel },
    DiagnosticStatusLineHint = { fg = groups.hint, bg = groups.panel },
    DiagnosticStatusLineInfo = { fg = groups.info, bg = groups.panel },
    DiagnosticStatusLineWarn = { fg = groups.warn, bg = groups.panel },
    DiagnosticUnderlineError = { sp = groups.error, undercurl = true },
    DiagnosticUnderlineHint = { sp = groups.hint, undercurl = true },
    DiagnosticUnderlineInfo = { sp = groups.info, undercurl = true },
    DiagnosticUnderlineWarn = { sp = groups.warn, undercurl = true },
    DiagnosticVirtualTextError = { fg = groups.error },
    DiagnosticVirtualTextHint = { fg = groups.hint },
    DiagnosticVirtualTextInfo = { fg = groups.info },
    DiagnosticVirtualTextWarn = { fg = groups.warn },

    -- TSAttribute = {},
    TSBoolean = { link = 'Boolean' },
    TSCharacter = { link = 'Character' },
    TSComment = { link = 'Comment' },
    TSConditional = { link = 'Conditional' },
    TSConstBuiltin = { fg = p.love },
    -- TSConstMacro = {},
    TSConstant = { fg = p.foam },
    TSConstructor = { fg = p.foam },
    -- TSEmphasis = {},
    -- TSError = {},
    -- TSException = {},
    TSField = { fg = p.foam },
    -- TSFloat = {},
    TSFuncBuiltin = { fg = p.love },
    -- TSFuncMacro = {},
    TSFunction = { fg = p.rose },
    TSInclude = { fg = p.pine },
    TSKeyword = { fg = p.pine },
    -- TSKeywordFunction = {},
    TSKeywordOperator = { fg = p.subtle },
    TSLabel = { fg = p.foam },
    -- TSLiteral = {},
    -- TSMethod = {},
    -- TSNamespace = {},
    -- TSNone = {},
    TSNumber = { link = 'Number' },
    TSOperator = { fg = p.subtle },
    TSParameter = { fg = p.iris, italic = styles.italic },
    -- TSParameterReference = {},
    TSProperty = { fg = p.iris, italic = styles.italic },
    TSPunctBracket = { fg = groups.punctuation },
    TSPunctDelimiter = { fg = groups.punctuation },
    TSPunctSpecial = { fg = groups.punctuation },
    -- TSRepeat = {},
    -- TSStrike = {},
    TSString = { link = 'String' },
    TSStringEscape = { fg = p.pine },
    -- TSStringRegex = {},
    TSStringSpecial = { link = 'TSString' },
    -- TSSymbol = {},
    TSTag = { fg = p.foam },
    TSTagDelimiter = { fg = p.subtle },
    TSText = { fg = p.text },
    TSTitle = { fg = groups.headings.h1, bold = true },
    TSType = { link = 'Type' },
    -- TSTypeBuiltin = {},
    TSURI = { fg = groups.link },
    -- TSUnderline = {},
    TSVariable = { fg = p.text, italic = styles.italic },
    TSVariableBuiltin = { fg = p.love },

    -- vim.lsp.buf.document_highlight()
    LspReferenceText = { bg = p.highlight_med },
    LspReferenceRead = { bg = p.highlight_med },
    LspReferenceWrite = { bg = p.highlight_med },

    -- lsp-highlight-codelens
    LspCodeLens = { fg = p.subtle }, -- virtual text of code lens
    LspCodeLensSeparator = { fg = p.highlight_high }, -- separator between two or more code lens

    -- romgrk/barbar.nvim
    BufferCurrent = { fg = p.text, bg = p.overlay },
    BufferCurrentIndex = { fg = p.text, bg = p.overlay },
    BufferCurrentMod = { fg = p.foam, bg = p.overlay },
    BufferCurrentSign = { fg = p.subtle, bg = p.overlay },
    BufferCurrentTarget = { fg = p.gold, bg = p.overlay },
    BufferInactive = { fg = p.subtle },
    BufferInactiveIndex = { fg = p.subtle },
    BufferInactiveMod = { fg = p.foam },
    BufferInactiveSign = { fg = p.muted },
    BufferInactiveTarget = { fg = p.gold },
    BufferTabpageFill = { fg = groups.background, bg = groups.background },
    BufferVisible = { fg = p.subtle },
    BufferVisibleIndex = { fg = p.subtle },
    BufferVisibleMod = { fg = p.foam },
    BufferVisibleSign = { fg = p.muted },
    BufferVisibleTarget = { fg = p.gold },

    -- lewis6991/gitsigns.nvim
    GitSignsAdd = { fg = groups.git_add },
    GitSignsChange = { fg = groups.git_change },
    GitSignsDelete = { fg = groups.git_delete },
    SignAdd = { link = 'GitSignsAdd' },
    SignChange = { link = 'GitSignsChange' },
    SignDelete = { link = 'GitSignsDelete' },

    -- mvllow/modes.nvim
    ModesCopy = { bg = p.gold },
    ModesDelete = { bg = p.love },
    ModesInsert = { bg = p.foam },
    ModesVisual = { bg = p.iris },

    -- kyazdani42/nvim-tree.lua
    NvimTreeEmptyFolderName = { fg = p.muted },
    NvimTreeFileDeleted = { fg = p.love },
    NvimTreeFileDirty = { fg = p.rose },
    NvimTreeFileMerge = { fg = p.iris },
    NvimTreeFileNew = { fg = p.foam },
    NvimTreeFileRenamed = { fg = p.pine },
    NvimTreeFileStaged = { fg = p.iris },
    NvimTreeFolderIcon = { fg = p.subtle },
    NvimTreeFolderName = { fg = p.foam },
    NvimTreeGitDeleted = { fg = groups.git_delete },
    NvimTreeGitDirty = { fg = groups.git_dirty },
    NvimTreeGitIgnored = { fg = groups.git_ignore },
    NvimTreeGitMerge = { fg = groups.git_merge },
    NvimTreeGitNew = { fg = groups.git_add },
    NvimTreeGitRenamed = { fg = groups.git_rename },
    NvimTreeGitStaged = { fg = groups.git_stage },
    NvimTreeImageFile = { fg = p.text },
    NvimTreeNormal = { fg = p.text },
    NvimTreeOpenedFile = { fg = p.text, bg = p.highlight_med },
    NvimTreeOpenedFolderName = { link = 'NvimTreeFolderName' },
    NvimTreeRootFolder = { fg = p.iris },
    NvimTreeSpecialFile = { link = 'NvimTreeNormal' },
    NvimTreeWindowPicker = { fg = groups.background, bg = p.iris },

    -- folke/which-key.nvim
    WhichKey = { fg = p.iris },
    WhichKeyGroup = { fg = p.foam },
    WhichKeySeparator = { fg = p.subtle },
    WhichKeyDesc = { fg = p.gold },
    WhichKeyFloat = { bg = groups.panel },
    WhichKeyValue = { fg = p.rose },

    -- luka-reineke/indent-blankline.nvim
    IndentBlanklineChar = { fg = p.muted },

    -- hrsh7th/nvim-cmp
    CmpItemAbbr = { fg = p.subtle },
    CmpItemAbbrDeprecated = { fg = p.subtle, strikethrough = true },
    CmpItemAbbrMatch = { fg = p.pine, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = p.pine, bold = true },
    CmpItemMenu = { fg = p.rose },
    CmpDocumentation = { fg = p.subtle },
    CmpDocumentationBorder = { fg = p.subtle },
    CmpItemKind = { fg = p.rose },

    -- TimUntersberger/neogit
    NeogitDiffAddHighlight = { fg = p.foam, bg = p.highlight_med },
    NeogitDiffContextHighlight = { bg = p.highlight_low },
    NeogitDiffDeleteHighlight = { fg = p.love, bg = p.highlight_med },
    NeogitHunkHeader = { bg = p.highlight_low },
    NeogitHunkHeaderHighlight = { bg = p.highlight_low },

    -- vimwiki/vimwiki
    VimwikiHR = { fg = p.subtle },
    VimwikiHeader1 = { fg = groups.headings.h1, bold = true },
    VimwikiHeader2 = { fg = groups.headings.h2, bold = true },
    VimwikiHeader3 = { fg = groups.headings.h3, bold = true },
    VimwikiHeader4 = { fg = groups.headings.h4, bold = true },
    VimwikiHeader5 = { fg = groups.headings.h5, bold = true },
    VimwikiHeader6 = { fg = groups.headings.h6, bold = true },
    VimwikiHeaderChar = { fg = p.pine },
    VimwikiLink = { fg = groups.link, underline = true },
    VimwikiList = { fg = p.iris },
    VimwikiNoExistsLink = { fg = p.love },

    -- nvim-neorg/neorg
    ['@neorg.headings.1.prefix'] = { fg = groups.headings.h1, bold = true },
    ['@neorg.headings.1.title'] = { fg = groups.headings.h1, bold = true },
    ['@neorg.headings.2.prefix'] = { fg = groups.headings.h2, bold = true },
    ['@neorg.headings.2.title'] = { fg = groups.headings.h2, bold = true },
    ['@neorg.headings.3.prefix'] = { fg = groups.headings.h3, bold = true },
    ['@neorg.headings.3.title'] = { fg = groups.headings.h3, bold = true },
    ['@neorg.headings.4.prefix'] = { fg = groups.headings.h4, bold = true },
    ['@neorg.headings.4.title'] = { fg = groups.headings.h4, bold = true },
    ['@neorg.headings.5.prefix'] = { fg = groups.headings.h5, bold = true },
    ['@neorg.headings.5.title'] = { fg = groups.headings.h5, bold = true },
    ['@neorg.headings.6.prefix'] = { fg = groups.headings.h6, bold = true },
    ['@neorg.headings.6.title'] = { fg = groups.headings.h6, bold = true },
    ['@neorg.markers.title'] = { fg = p.text, bold = true },

    -- tami5/lspsaga.nvim (fork of glepnir/lspsaga.nvim)
    DefinitionCount = { fg = p.rose },
    DefinitionIcon = { fg = p.rose },
    DefintionPreviewTitle = { fg = p.rose, bold = true },
    LspFloatWinBorder = { fg = groups.border },
    LspFloatWinNormal = { bg = groups.background },
    LspSagaAutoPreview = { fg = p.subtle },
    LspSagaCodeActionBorder = { fg = groups.border },
    LspSagaCodeActionContent = { fg = p.foam },
    LspSagaCodeActionTitle = { fg = p.gold, bold = true },
    LspSagaCodeActionTruncateLine = { link = 'LspSagaCodeActionBorder' },
    LspSagaDefPreviewBorder = { fg = groups.border },
    LspSagaDiagnosticBorder = { fg = groups.border },
    LspSagaDiagnosticHeader = { fg = p.gold, bold = true },
    LspSagaDiagnosticTruncateLine = { link = 'LspSagaDiagnosticBorder' },
    LspSagaDocTruncateLine = { link = 'LspSagaHoverBorder' },
    LspSagaFinderSelection = { fg = p.gold },
    LspSagaHoverBorder = { fg = groups.border },
    LspSagaLspFinderBorder = { fg = groups.border },
    LspSagaRenameBorder = { fg = p.pine },
    LspSagaRenamePromptPrefix = { fg = p.love },
    LspSagaShTruncateLine = { link = 'LspSagaSignatureHelpBorder' },
    LspSagaSignatureHelpBorder = { fg = p.pine },
    ReferencesCount = { fg = p.rose },
    ReferencesIcon = { fg = p.rose },
    SagaShadow = { bg = p.overlay },
    TargetWord = { fg = p.iris },

    -- ray-x/lsp_signature.nvim
    LspSignatureActiveParameter = { bg = p.overlay },

    -- rlane/pounce.nvim
    PounceAccept = { fg = p.love, bg = p.highlight_high },
    PounceAcceptBest = { fg = p.base, bg = p.gold },
    PounceGap = { link = 'Search' },
    PounceMatch = { link = 'Search' },

    -- ThePrimeagen/harpoon
    HarpoonBorder = { fg = groups.border },

    -- nvim-telescope/telescope.nvim
    TelescopeBorder = { fg = groups.border },
    TelescopeMatching = { fg = p.rose },
    TelescopeNormal = { fg = p.text },
    TelescopePromptNormal = { fg = p.text },
    TelescopePromptPrefix = { fg = p.rose },
    TelescopeSelection = { fg = p.pine, bg = p.overlay },
    TelescopeSelectionCaret = { fg = p.rose, bg = p.overlay },
    TelescopeTitle = { fg = p.text },

    -- rcarriga/nvim-notify
    NotifyINFOBorder = { fg = p.foam },
    NotifyINFOTitle = { link = 'NotifyINFOBorder' },
    NotifyINFOIcon = { link = 'NotifyINFOBorder' },
    NotifyWARNBorder = { fg = p.gold },
    NotifyWARNTitle = { link = 'NotifyWARNBorder' },
    NotifyWARNIcon = { link = 'NotifyWARNBorder' },
    NotifyDEBUGBorder = { fg = p.muted },
    NotifyDEBUGTitle = { link = 'NotifyDEBUGBorder' },
    NotifyDEBUGIcon = { link = 'NotifyDEBUGBorder' },
    NotifyTRACEBorder = { fg = p.iris },
    NotifyTRACETitle = { link = 'NotifyTRACEBorder' },
    NotifyTRACEIcon = { link = 'NotifyTRACEBorder' },
    NotifyERRORBorder = { fg = p.love },
    NotifyERRORTitle = { link = 'NotifyERRORBorder' },
    NotifyERRORIcon = { link = 'NotifyERRORBorder' },

    -- rcarriga/nvim-dap-ui
    DapUIVariable = { link = 'Normal' },
    DapUIValue = { link = 'Normal' },
    DapUIFrameName = { link = 'Normal' },
    DapUIThread = { fg = p.gold },
    DapUIWatchesValue = { link = 'DapUIThread' },
    DapUIBreakpointsInfo = { link = 'DapUIThread' },
    DapUIBreakpointsCurrentLine = { fg = p.gold, bold = true },
    DapUIWatchesEmpty = { fg = p.love },
    DapUIWatchesError = { link = 'DapUIWatchesEmpty' },
    DapUIBreakpointsDisabledLine = { fg = p.muted },
    DapUISource = { fg = p.iris },
    DapUIBreakpointsPath = { fg = p.foam },
    DapUIScope = { link = 'DapUIBreakpointsPath' },
    DapUILineNumber = { link = 'DapUIBreakpointsPath' },
    DapUIBreakpointsLine = { link = 'DapUIBreakpointsPath' },
    DapUIFloatBorder = { link = 'DapUIBreakpointsPath' },
    DapUIStoppedThread = { link = 'DapUIBreakpointsPath' },
    DapUIDecoration = { link = 'DapUIBreakpointsPath' },
    DapUIModifiedValue = { fg = p.foam, bold = true },

    -- glepnir/dashboard-nvim
    DashboardShortcut = { fg = p.love },
    DashboardHeader = { fg = p.pine },
    DashboardCenter = { fg = p.gold },
    DashboardFooter = { fg = p.iris },

    --p00f/nvim-ts-rainbow
    rainbowcol1 = { fg = p.love },
    rainbowcol2 = { fg = p.rose },
    rainbowcol3 = { fg = p.pine },
    rainbowcol4 = { fg = p.iris },
    rainbowcol5 = { fg = p.gold },
    rainbowcol6 = { fg = p.foam },
    rainbowcol7 = { fg = p.text },

    -- j-hui/fidget.nvim
    FidgetTitle = { fg = p.love },
    FidgetTask = { fg = p.pine },
  }

  vim.g.terminal_color_0 = p.overlay -- black
  vim.g.terminal_color_8 = p.subtle -- bright black
  vim.g.terminal_color_1 = p.love -- red
  vim.g.terminal_color_9 = p.love -- bright red
  vim.g.terminal_color_2 = p.pine -- green
  vim.g.terminal_color_10 = p.pine -- bright green
  vim.g.terminal_color_3 = p.gold -- yellow
  vim.g.terminal_color_11 = p.gold -- bright yellow
  vim.g.terminal_color_4 = p.foam -- blue
  vim.g.terminal_color_12 = p.foam -- bright blue
  vim.g.terminal_color_5 = p.iris -- magenta
  vim.g.terminal_color_13 = p.iris -- bright magenta
  vim.g.terminal_color_6 = p.rose -- cyan
  vim.g.terminal_color_14 = p.rose -- bright cyan
  vim.g.terminal_color_7 = p.text -- white
  vim.g.terminal_color_15 = p.text -- bright white

  return theme
end

return M
