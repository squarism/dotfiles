local wezterm = require 'wezterm'
local act = wezterm.action

return {

  -- General
  quit_when_all_windows_are_closed = false,
  use_fancy_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,
  audible_bell = "Disabled",
  default_prog = { "/opt/homebrew/bin/fish" },
  native_macos_fullscreen_mode = false,
  scrollback_lines = 9000,


  -- Font
  font = wezterm.font("FiraCode Nerd Font", { weight = "Regular" }),
  font_size = 11.0,
  bold_brightens_ansi_colors = false,
  -- Disable ligatures like -calt (also nuke clig/liga to be thorough)
  harfbuzz_features = { "calt=0", "clig=0", "liga=0" },

  -- Colors
  color_scheme = "Twilight (base16)",

  -- Window decorations & padding
  window_decorations = "RESIZE",
  window_padding = { left = 5, right = 5, top = 5, bottom = 5 },


  -- Mouse
  hide_mouse_cursor_when_typing = true,

  -- Copy on select -> system clipboard
  mouse_bindings = {
    {
      event = { Up = { streak = 1, button = "Left" } },
      mods = "NONE",
      action = act.CompleteSelection("Clipboard"), -- or "ClipboardAndPrimarySelection"
    },
    -- require CMD+click to open links (prevents accidental opens)
    {
      event = { Up = { streak = 1, button = "Left" } },
      mods = "CMD",
      action = act.OpenLinkAtMouseCursor,
    },
  },


  -- Keys
  keys = {
    { key = "PageUp",   mods = "SHIFT", action = act.ScrollByPage(-1) },
    { key = "PageDown", mods = "SHIFT", action = act.ScrollByPage(1)  },

    { key = "Enter", mods = "CMD", action = wezterm.action.ToggleFullScreen },

    -- iTerm-style splits
    { key = "d", mods = "CMD",        action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
    { key = "d", mods = "CMD|SHIFT",  action = act.SplitVertical   { domain = "CurrentPaneDomain" } },

    -- quake mode still an issue:
    -- https://github.com/wezterm/wezterm/issues/1751
  },
}

