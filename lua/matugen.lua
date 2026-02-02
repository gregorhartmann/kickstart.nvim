local M = {}

function M.setup()
  require('base16-colorscheme').setup {
    -- Background tones
    base00 = '#23201a', -- Default Background
    base01 = '#3a362c', -- Lighter Background (status bars)
    base02 = '#353127', -- Selection Background
    base03 = '#6f6a5b', -- Comments, Invisibles
    -- Foreground tones
    base04 = '#b6b4af', -- Dark Foreground (status bars)
    base05 = '#f3f3f2', -- Default Foreground
    base06 = '#f3f3f2', -- Light Foreground
    base07 = '#f3f3f2', -- Lightest Foreground
    -- Accent colors
    base08 = '#fd4663', -- Variables, XML Tags, Errors
    base09 = '#83cc66', -- Integers, Constants
    base0A = '#bbd65c', -- Classes, Search Background
    base0B = '#e4c167', -- Strings, Diff Inserted
    base0C = '#ade996', -- Regex, Escape Chars
    base0D = '#ecd393', -- Functions, Methods
    base0E = '#d6e996', -- Keywords, Storage
    base0F = '#900017', -- Deprecated, Embedded Tags
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
