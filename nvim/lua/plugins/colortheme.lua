return {
  'myna676/everblush-fork',
  lazy = false,
  priority = 1000,
  config = function()
    -- Variable to track transparency state
    local bg_transparent = true

    -- Function to toggle Everblush transparent background
    local function toggle_transparency()
      -- Toggle the transparency setting
      bg_transparent = not bg_transparent

      -- Update Everblush's transparent background option
      require('everblush').setup({
        transparent_background = bg_transparent
      })

      -- Reapply colorscheme to take effect
      vim.cmd('colorscheme everblush')
    end

    -- Keymap for toggling transparency: <leader>bg
    vim.keymap.set('n', '<leader>ot', toggle_transparency, { noremap = true, silent = true, desc = 'Toggle Everblush Background Transparency' })

    -- Apply the Everblush colorscheme on startup with default settings
    vim.cmd('colorscheme everblush')
  end,
}
