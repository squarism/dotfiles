-- language-specific plugins

return {
  -- markdown
  {
    "preservim/vim-markdown",
    ft = "markdown",
    init = function()
      vim.g.vim_markdown_folding_disabled = 1
    end,
  },

  -- crystal
  { "elbywan/crystalline", ft = "crystal" },
  { "vim-crystal/vim-crystal", ft = "crystal" },

  -- zig
  { "ziglang/zig.vim", ft = "zig" },
}
