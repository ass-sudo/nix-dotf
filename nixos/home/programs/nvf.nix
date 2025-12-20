{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  programs.nvf = {
    enable = true;
    
    settings.vim.extraPackages = with pkgs; [
      wl-clipboard
      ripgrep
      fd
    ];
    
    settings.vim = {
      viAlias = true;
      vimAlias = true;
      
      theme = {
        enable = false;
        name = "onedark";
        style = "darker";
      };
      
      luaConfigRC.clipboard = ''
        vim.opt.clipboard = "unnamedplus"
      '';
      
      luaConfigRC.customColors = ''
        vim.api.nvim_create_autocmd("ColorScheme", {
          pattern = "*",
          callback = function()
            vim.api.nvim_set_hl(0, "Normal", { bg = "#0c0a0c", fg = "#e0e0e0" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#151215", fg = "#e0e0e0" })
            vim.api.nvim_set_hl(0, "Cursor", { bg = "#61afef", fg = "#0c0a0c" })
            vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1b171b" })
            vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "#0c0a0c", bg = "#0c0a0c" }) -- Убираем ~
            
            vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#0c0a0c", fg = "#e0e0e0" })
            vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "#0c0a0c" })
            vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#61afef", bold = true })
            vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#61afef" })
            vim.api.nvim_set_hl(0, "NeoTreeCursorLine", { bg = "#2c2a2a", bold = true })
            
            vim.g.terminal_color_0 = "#0c0a0c"
            vim.g.terminal_color_1 = "#e06c75"
            vim.g.terminal_color_2 = "#98c379"
            vim.g.terminal_color_3 = "#e5c07b"
            vim.g.terminal_color_4 = "#61afef"
            vim.g.terminal_color_5 = "#c678dd"
            vim.g.terminal_color_6 = "#56b6c2"
            vim.g.terminal_color_7 = "#e0e0e0"
            
            vim.api.nvim_set_hl(0, "LineNr", { fg = "#4b5263", bg = "#0c0a0c" })
            vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#e5c07b", bg = "#0c0a0c", bold = true })
            vim.api.nvim_set_hl(0, "SignColumn", { bg = "#0c0a0c" })
            vim.api.nvim_set_hl(0, "VertSplit", { fg = "#2c2a2a", bg = "#0c0a0c" })
            vim.api.nvim_set_hl(0, "StatusLine", { bg = "#2c2a2a", fg = "#e0e0e0" })
            vim.api.nvim_set_hl(0, "Pmenu", { bg = "#1b171b", fg = "#e0e0e0" })
            vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#2c2a2a", fg = "#61afef", bold = true })
            
            vim.api.nvim_set_hl(0, "Comment", { fg = "#5c6370", italic = true })
            vim.api.nvim_set_hl(0, "Constant", { fg = "#d19a66" })
            vim.api.nvim_set_hl(0, "String", { fg = "#98c379" })
            vim.api.nvim_set_hl(0, "Number", { fg = "#d19a66" })
            vim.api.nvim_set_hl(0, "Boolean", { fg = "#d19a66" })
            vim.api.nvim_set_hl(0, "Float", { fg = "#d19a66" })
            
            vim.api.nvim_set_hl(0, "Identifier", { fg = "#e06c75" })
            vim.api.nvim_set_hl(0, "Function", { fg = "#61afef" })
            vim.api.nvim_set_hl(0, "Statement", { fg = "#c678dd" })
            vim.api.nvim_set_hl(0, "Conditional", { fg = "#c678dd" })
            vim.api.nvim_set_hl(0, "Repeat", { fg = "#c678dd" })
            vim.api.nvim_set_hl(0, "Operator", { fg = "#56b6c2" })
            vim.api.nvim_set_hl(0, "Keyword", { fg = "#c678dd" })
            
            vim.api.nvim_set_hl(0, "PreProc", { fg = "#e5c07b" })
            vim.api.nvim_set_hl(0, "Include", { fg = "#c678dd" })
            vim.api.nvim_set_hl(0, "Type", { fg = "#e5c07b" })
            vim.api.nvim_set_hl(0, "Special", { fg = "#61afef" })
            
            vim.api.nvim_set_hl(0, "Error", { fg = "#e06c75" })
            vim.api.nvim_set_hl(0, "WarningMsg", { fg = "#e5c07b" })
            vim.api.nvim_set_hl(0, "Todo", { fg = "#c678dd", bold = true })
          end,
        })
        
        vim.schedule(function()
          vim.cmd("doautocmd ColorScheme")
        end)
      '';
      
      luaConfigRC.extraPlugins = ''
        require("ibl").setup({ indent = { char = "│" }, scope = { enabled = true } })
        require("colorizer").setup()
        require("todo-comments").setup()
        require("trouble").setup()
        require("hop").setup()
      '';
      
      lineNumberMode = "relNumber";
      
      statusline.lualine = {
        enable = true;
        theme = "auto";
      };
      
      filetree.neo-tree = {
        enable = true;
        setupOpts = {
          close_if_last_window = true;
          enable_git_status = true;
          filesystem = {
            filtered_items = {
              hide_dotfiles = false;
            };
          };
          window = {
            width = 30;
          };
        };
      };
      
      telescope.enable = true;
      treesitter = {
        enable = true;
        fold = true;
        context.enable = true;
      };
      
      lsp = {
        enable = true;
        formatOnSave = true;
        lspkind.enable = true;
        lightbulb.enable = true;
      };
      
      autocomplete.nvim-cmp = {
        enable = true;
        setupOpts.sources = lib.mkForce [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
      };
      
      snippets.luasnip.enable = true;
      git = {
        enable = true;
        gitsigns.enable = true;
      };
      
      autopairs.nvim-autopairs.enable = true;
      comments.comment-nvim.enable = true;
      binds.whichKey.enable = true;
      
      startPlugins = with pkgs.vimPlugins; [
        indent-blankline-nvim
        nvim-colorizer-lua
        todo-comments-nvim
        trouble-nvim
        hop-nvim
      ];
      
      maps.normal = {
        "L" = { action = ":bnext<CR>"; desc = "Next buffer"; };
        "H" = { action = ":bprevious<CR>"; desc = "Prev buffer"; };
        "<leader>e" = { action = ":Neotree toggle<CR>"; silent = true; desc = "Toggle explorer"; };
        "<leader>ff" = { action = ":Telescope find_files<CR>"; };
        "<leader>w" = { action = ":w<CR>"; };
        "<leader>q" = { action = ":q<CR>"; };
        "<C-h>" = { action = "<C-w>h"; };
        "<C-j>" = { action = "<C-w>j"; };
        "<C-k>" = { action = "<C-w>k"; };
        "<C-l>" = { action = "<C-w>l"; };
      };
      
      maps.insert = {
        "jk" = { action = "<Esc>"; };
      };
      
      maps.visual = {
        "<leader>y" = { action = ''"+y''; };
      };
    };
  };
}
