{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  programs.nvf = {
    enable = true;
    
    # Добавляем wl-clipboard в PATH для nvim
    settings.vim.extraPackages = with pkgs; [
      wl-clipboard
    ];
    
    settings.vim = {
      viAlias = true;
      vimAlias = true;
      
      theme = {
        enable = true;
        name = "onedark";
        style = "darker";
      };
      
      # Clipboard
      luaConfigRC.clipboard = ''
        -- Системный буфер обмена
        vim.opt.clipboard = "unnamedplus"
      '';
      
      lineNumberMode = "relNumber";
      
      statusline.lualine = {
        enable = true;
        theme = "auto";
      };
      
      tabline.nvimBufferline.enable = true;
      
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
      };
    };
  };
}
