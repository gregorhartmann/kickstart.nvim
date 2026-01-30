local M = {}

function M.setup()
  require('base16-colorscheme').setup {
    -- Background tones
    base00 = '#291414', -- Default Background
    base01 = '#452122', -- Lighter Background (status bars)
    base02 = '#3e1e1f', -- Selection Background
    base03 = '#756161', -- Comments, Invisibles
    -- Foreground tones
    base04 = '#b6afaf', -- Dark Foreground (status bars)
    base05 = '#f3f2f2', -- Default Foreground
    base06 = '#f3f2f2', -- Light Foreground
    base07 = '#f3f2f2', -- Lightest Foreground
    -- Accent colors
    base08 = '#d5585b', -- Variables, XML Tags, Errors
    base09 = '#d6d35c', -- Integers, Constants
    base0A = '#dd9c55', -- Classes, Search Background
    base0B = '#e4676a', -- Strings, Diff Inserted
    base0C = '#e9e796', -- Regex, Escape Chars
    base0D = '#ec9395', -- Functions, Methods
    base0E = '#eac195', -- Keywords, Storage
    base0F = '#6b0f12', -- Deprecated, Embedded Tags
  }
end

-- Register a signal handler for SIGUSR1 (matugen updates)
local signal = vim.uv.new_signal()
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
