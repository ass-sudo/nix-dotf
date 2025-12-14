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
      
      # Clipboard
      luaConfigRC.clipboard = ''
        vim.opt.clipboard = "unnamedplus"
      '';
      
      # Custom Colors
      luaConfigRC.customColors = ''
        vim.api.nvim_create_autocmd("ColorScheme", {
          pattern = "*",
          callback = function()
            vim.api.nvim_set_hl(0, "Normal", { bg = "#0c0a0c", fg = "#e0e0e0" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#151215", fg = "#e0e0e0" })
            vim.api.nvim_set_hl(0, "Cursor", { bg = "#61afef", fg = "#0c0a0c" })
            vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1b171b" })
            
            vim.g.terminal_color_0 = "#0c0a0c"
            vim.g.terminal_color_1 = "#e06c75"
            vim.g.terminal_color_2 = "#98c379"
            vim.g.terminal_color_3 = "#e5c07b"
            vim.g.terminal_color_4 = "#61afef"
            vim.g.terminal_color_5 = "#c678dd"
            vim.g.terminal_color_6 = "#56b6c2"
            vim.g.terminal_color_7 = "#e0e0e0"
            vim.g.terminal_color_8 = "#5c6370"
            vim.g.terminal_color_9 = "#e06c75"
            vim.g.terminal_color_10 = "#98c379"
            vim.g.terminal_color_11 = "#e5c07b"
            vim.g.terminal_color_12 = "#61afef"
            vim.g.terminal_color_13 = "#c678dd"
            vim.g.terminal_color_14 = "#56b6c2"
            vim.g.terminal_color_15 = "#e0e0e0"
            
            vim.api.nvim_set_hl(0, "LineNr", { fg = "#4b5263", bg = "#0c0a0c" })
            vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#e5c07b", bg = "#0c0a0c", bold = true })
            vim.api.nvim_set_hl(0, "SignColumn", { bg = "#0c0a0c" })
            vim.api.nvim_set_hl(0, "VertSplit", { fg = "#2c2a2a", bg = "#0c0a0c" })
            vim.api.nvim_set_hl(0, "StatusLine", { bg = "#2c2a2a", fg = "#e0e0e0" })
            vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#1b171b", fg = "#5c6370" })
            vim.api.nvim_set_hl(0, "Pmenu", { bg = "#1b171b", fg = "#e0e0e0" })
            vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#2c2a2a", fg = "#61afef", bold = true })
            vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#1b171b" })
            vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#4b5263" })
            
            vim.api.nvim_set_hl(0, "Comment", { fg = "#5c6370", italic = true })
            vim.api.nvim_set_hl(0, "Constant", { fg = "#d19a66" })
            vim.api.nvim_set_hl(0, "String", { fg = "#98c379" })
            vim.api.nvim_set_hl(0, "Character", { fg = "#98c379" })
            vim.api.nvim_set_hl(0, "Number", { fg = "#d19a66" })
            vim.api.nvim_set_hl(0, "Boolean", { fg = "#d19a66" })
            vim.api.nvim_set_hl(0, "Float", { fg = "#d19a66" })
            
            vim.api.nvim_set_hl(0, "Identifier", { fg = "#e06c75" })
            vim.api.nvim_set_hl(0, "Function", { fg = "#61afef" })
            
            vim.api.nvim_set_hl(0, "Statement", { fg = "#c678dd" })
            vim.api.nvim_set_hl(0, "Conditional", { fg = "#c678dd" })
            vim.api.nvim_set_hl(0, "Repeat", { fg = "#c678dd" })
            vim.api.nvim_set_hl(0, "Label", { fg = "#c678dd" })
            vim.api.nvim_set_hl(0, "Operator", { fg = "#56b6c2" })
            vim.api.nvim_set_hl(0, "Keyword", { fg = "#c678dd" })
            vim.api.nvim_set_hl(0, "Exception", { fg = "#c678dd" })
            
            vim.api.nvim_set_hl(0, "PreProc", { fg = "#e5c07b" })
            vim.api.nvim_set_hl(0, "Include", { fg = "#c678dd" })
            vim.api.nvim_set_hl(0, "Define", { fg = "#c678dd" })
            vim.api.nvim_set_hl(0, "Macro", { fg = "#c678dd" })
            vim.api.nvim_set_hl(0, "PreCondit", { fg = "#e5c07b" })
            
            vim.api.nvim_set_hl(0, "Type", { fg = "#e5c07b" })
            vim.api.nvim_set_hl(0, "StorageClass", { fg = "#e5c07b" })
            vim.api.nvim_set_hl(0, "Structure", { fg = "#e5c07b" })
            vim.api.nvim_set_hl(0, "Typedef", { fg = "#e5c07b" })
            
            vim.api.nvim_set_hl(0, "Special", { fg = "#61afef" })
            vim.api.nvim_set_hl(0, "SpecialChar", { fg = "#d19a66" })
            vim.api.nvim_set_hl(0, "Tag", { fg = "#e06c75" })
            vim.api.nvim_set_hl(0, "Delimiter", { fg = "#abb2bf" })
            vim.api.nvim_set_hl(0, "SpecialComment", { fg = "#5c6370" })
            vim.api.nvim_set_hl(0, "Debug", { fg = "#e06c75" })
            
            vim.api.nvim_set_hl(0, "DiffAdd", { fg = "#98c379", bg = "#1b171b" })
            vim.api.nvim_set_hl(0, "DiffChange", { fg = "#e5c07b", bg = "#1b171b" })
            vim.api.nvim_set_hl(0, "DiffDelete", { fg = "#e06c75", bg = "#1b171b" })
            vim.api.nvim_set_hl(0, "DiffText", { fg = "#61afef", bg = "#2c2a2a" })
            
            vim.api.nvim_set_hl(0, "Search", { bg = "#e5c07b", fg = "#0c0a0c" })
            vim.api.nvim_set_hl(0, "IncSearch", { bg = "#61afef", fg = "#0c0a0c" })
            
            vim.api.nvim_set_hl(0, "Error", { fg = "#e06c75" })
            vim.api.nvim_set_hl(0, "ErrorMsg", { fg = "#e06c75" })
            vim.api.nvim_set_hl(0, "WarningMsg", { fg = "#e5c07b" })
            vim.api.nvim_set_hl(0, "Todo", { fg = "#c678dd", bold = true })
          end,
        })
        
        vim.schedule(function()
          vim.cmd("doautocmd ColorScheme")
        end)
      '';
      
      # Дополнительные плагины
      luaConfigRC.extraPlugins = ''
        -- Indent blankline
        require("ibl").setup({
          indent = {
            char = "│",
          },
          scope = {
            enabled = true,
            show_start = true,
            show_end = false,
          },
        })
        
        -- Colorizer
        require("colorizer").setup()
        
        -- Todo comments
        require("todo-comments").setup()
        
        -- Trouble
        require("trouble").setup()
        
        -- Hop
        require("hop").setup()
      '';
      
      lineNumberMode = "relNumber";
      
      statusline.lualine = {
        enable = true;
        theme = "auto";
      };
      
      tabline.nvimBufferline = {
        enable = true;
        setupOpts = {
          options = {
            themable = true;
          };
          highlights = {
            fill = { bg = "#0c0a0c"; };
            background = { bg = "#0c0a0c"; };
            tab = { bg = "#0c0a0c"; };
            tab_selected = { bg = "#1b171b"; };
            tab_separator = { bg = "#0c0a0c"; };
            tab_separator_selected = { bg = "#1b171b"; };
            tab_close = { bg = "#0c0a0c"; };
            close_button = { bg = "#0c0a0c"; };
            close_button_visible = { bg = "#0c0a0c"; };
            close_button_selected = { bg = "#1b171b"; };
            buffer_visible = { bg = "#0c0a0c"; };
            buffer_selected = {
              bg = "#1b171b";
              bold = true;
              italic = false;
            };
            numbers = { bg = "#0c0a0c"; };
            numbers_visible = { bg = "#0c0a0c"; };
            numbers_selected = {
              bg = "#1b171b";
              bold = true;
              italic = false;
            };
            diagnostic = { bg = "#0c0a0c"; };
            diagnostic_visible = { bg = "#0c0a0c"; };
            diagnostic_selected = {
              bg = "#1b171b";
              bold = true;
              italic = false;
            };
            hint = { bg = "#0c0a0c"; };
            hint_visible = { bg = "#0c0a0c"; };
            hint_selected = {
              bg = "#1b171b";
              bold = true;
              italic = false;
            };
            hint_diagnostic = { bg = "#0c0a0c"; };
            hint_diagnostic_visible = { bg = "#0c0a0c"; };
            hint_diagnostic_selected = {
              bg = "#1b171b";
              bold = true;
              italic = false;
            };
            info = { bg = "#0c0a0c"; };
            info_visible = { bg = "#0c0a0c"; };
            info_selected = {
              bg = "#1b171b";
              bold = true;
              italic = false;
            };
            info_diagnostic = { bg = "#0c0a0c"; };
            info_diagnostic_visible = { bg = "#0c0a0c"; };
            info_diagnostic_selected = {
              bg = "#1b171b";
              bold = true;
              italic = false;
            };
            warning = { bg = "#0c0a0c"; };
            warning_visible = { bg = "#0c0a0c"; };
            warning_selected = {
              bg = "#1b171b";
              bold = true;
              italic = false;
            };
            warning_diagnostic = { bg = "#0c0a0c"; };
            warning_diagnostic_visible = { bg = "#0c0a0c"; };
            warning_diagnostic_selected = {
              bg = "#1b171b";
              bold = true;
              italic = false;
            };
            error = { bg = "#0c0a0c"; };
            error_visible = { bg = "#0c0a0c"; };
            error_selected = {
              bg = "#1b171b";
              bold = true;
              italic = false;
            };
            error_diagnostic = { bg = "#0c0a0c"; };
            error_diagnostic_visible = { bg = "#0c0a0c"; };
            error_diagnostic_selected = {
              bg = "#1b171b";
              bold = true;
              italic = false;
            };
            modified = { bg = "#0c0a0c"; };
            modified_visible = { bg = "#0c0a0c"; };
            modified_selected = { bg = "#1b171b"; };
            duplicate_selected = {
              bg = "#1b171b";
              italic = false;
            };
            duplicate_visible = {
              bg = "#0c0a0c";
              italic = false;
            };
            duplicate = {
              bg = "#0c0a0c";
              italic = false;
            };
            separator_selected = { bg = "#1b171b"; };
            separator_visible = { bg = "#0c0a0c"; };
            separator = { bg = "#0c0a0c"; };
            indicator_selected = { bg = "#1b171b"; };
            indicator_visible = { bg = "#0c0a0c"; };
            pick_selected = {
              bg = "#1b171b";
              bold = true;
              italic = false;
            };
            pick_visible = {
              bg = "#0c0a0c";
              bold = true;
              italic = false;
            };
            pick = {
              bg = "#0c0a0c";
              bold = true;
              italic = false;
            };
            offset_separator = { bg = "#0c0a0c"; };
            trunc_marker = { bg = "#0c0a0c"; };
          };
        };
      };
      
      filetree.neo-tree = {
        enable = true;
        setupOpts = {
          close_if_last_window = true;
          enable_git_status = true;
          enable_diagnostics = true;
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
      
      # ИСПРАВЛЕНО: используем lib.mkForce
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
        gitsigns.codeActions.enable = false;
      };
      
      autopairs.nvim-autopairs.enable = true;
      comments.comment-nvim.enable = true;
      binds.whichKey.enable = true;
      
      # Дополнительные плагины (правильная структура)
      startPlugins = with pkgs.vimPlugins; [
        indent-blankline-nvim
        nvim-colorizer-lua
        todo-comments-nvim
        trouble-nvim
        hop-nvim
      ];
      
      maps = {
        normal = {
          "<leader>e" = {
            action = ":Neotree toggle<CR>";
            silent = true;
            desc = "Toggle file explorer";
          };
          
          "<leader>ff" = {
            action = ":Telescope find_files<CR>";
            silent = true;
            desc = "Find files";
          };
          "<leader>fg" = {
            action = ":Telescope live_grep<CR>";
            silent = true;
            desc = "Live grep";
          };
          "<leader>fb" = {
            action = ":Telescope buffers<CR>";
            silent = true;
            desc = "Find buffers";
          };
          "<leader>ft" = {
            action = ":TodoTelescope<CR>";
            silent = true;
            desc = "Find todos";
          };
          
          # LSP
          "gd" = {
            action = ":lua vim.lsp.buf.definition()<CR>";
            silent = true;
            desc = "Go to definition";
          };
          "gr" = {
            action = ":lua vim.lsp.buf.references()<CR>";
            silent = true;
            desc = "References";
          };
          "K" = {
            action = ":lua vim.lsp.buf.hover()<CR>";
            silent = true;
            desc = "Hover documentation";
          };
          "<leader>rn" = {
            action = ":lua vim.lsp.buf.rename()<CR>";
            silent = true;
            desc = "Rename";
          };
          "<leader>ca" = {
            action = ":lua vim.lsp.buf.code_action()<CR>";
            silent = true;
            desc = "Code action";
          };
          
          # Diagnostics
          "[d" = {
            action = ":lua vim.diagnostic.goto_prev()<CR>";
            silent = true;
            desc = "Previous diagnostic";
          };
          "]d" = {
            action = ":lua vim.diagnostic.goto_next()<CR>";
            silent = true;
            desc = "Next diagnostic";
          };
          
          # Trouble
          "<leader>xx" = {
            action = ":TroubleToggle<CR>";
            silent = true;
            desc = "Toggle trouble";
          };
          
          # Hop
          "<leader>hw" = {
            action = ":HopWord<CR>";
            silent = true;
            desc = "Hop to word";
          };
          "<leader>hl" = {
            action = ":HopLine<CR>";
            silent = true;
            desc = "Hop to line";
          };
          
          "<leader>w" = {
            action = ":w<CR>";
            silent = true;
            desc = "Save file";
          };
          "<leader>q" = {
            action = ":q<CR>";
            silent = true;
            desc = "Quit";
          };
          
          "<Tab>" = {
            action = ":bnext<CR>";
            silent = true;
            desc = "Next buffer";
          };
          "<S-Tab>" = {
            action = ":bprevious<CR>";
            silent = true;
            desc = "Previous buffer";
          };
          
          "<C-h>" = {
            action = "<C-w>h";
            silent = true;
            desc = "Move left";
          };
          "<C-j>" = {
            action = "<C-w>j";
            silent = true;
            desc = "Move down";
          };
          "<C-k>" = {
            action = "<C-w>k";
            silent = true;
            desc = "Move up";
          };
          "<C-l>" = {
            action = "<C-w>l";
            silent = true;
            desc = "Move right";
          };
        };
        
        visual = {
          "J" = {
            action = ":m '>+1<CR>gv=gv";
            silent = true;
            desc = "Move line down";
          };
          "K" = {
            action = ":m '<-2<CR>gv=gv";
            silent = true;
            desc = "Move line up";
          };
          
          "<leader>y" = {
            action = ''"+y'';
            silent = true;
            desc = "Copy to clipboard";
          };
        };
        
        insert = {
          "jk" = {
            action = "<ESC>";
            silent = true;
            desc = "Exit insert mode";
          };
        };
      };
    };
  };
}
