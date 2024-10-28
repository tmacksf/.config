local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config")

local themes = require("themes.themes")

local function get_entries(theme_entries)
  local entries = {}
  for theme_name, theme in pairs(theme_entries) do
    for _, style in pairs(theme.styles) do
      table.insert(entries, { theme_name, style, theme.transparent })
    end
  end
  return entries
end

-- Telescope theme switcher function
Themes = function(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "Themes",
    finder = finders.new_table {
      results = get_entries(themes.themes),
      entry_maker = function(entry)
        local name = entry[1] .. " - " .. entry[2]
        return {
          value = entry,
          display = name,
          ordinal = name,
        }
      end,
    },
    sorter = conf.values.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, _)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)

        local entry = action_state.get_selected_entry().value
        themes.activate_theme(entry[1], entry[2], entry[3])
      end)
      return true
    end,
  }):find()
end


vim.keymap.set("n", "<leader>ft", ":lua Themes(require(\"telescope.themes\").get_dropdown{})<CR>",
      { desc = 'Telescope change theme' })
