{ config, pkgs, ... }:
{
  home.username = "toby";
  home.homeDirectory = "/home/toby";

  # Enable font handling
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    _1password-gui # 1Password
    pyenv
    gnomeExtensions.ddterm # Quake like dropdown terminal
    deja-dup # Backup
    fastfetch # Neofetch alternative / system overview
    kitty # Modern terminal emulator
    shortwave # Internet radio player
    zsh
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    fira-code
  ];

  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      # Enable ddterm terminal
      enabled-extensions = [
        "ddterm@amezin.github.com"
      ];
      # Clear deliberatly to not extension in enabled and disabled at the same time due to manual settings
      disabled-extensions = [];
    };
    "com/github/amezin/ddterm" = {
      use-system-font = false;
      custom-font = "FiraCode Nerd Font 12";
      audible-bell = false;
      hide-when-focus-lost = true;
      ddterm-toggle-hotkey = ["<Control>space"];
      tab-label-ellipsize-mode = "none";
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = pkgs.lib.importTOML ./starship.toml;
  };

  programs.vim = {
    enable = true;
    defaultEditor = true;
    extraConfig = ''
      set nocompatible
      autocmd FileType nix setlocal ts=2 sts=2 sw=2 expandtab
    '';
  };

  programs.zsh = {
    enable = true;
    # Set keymap to "emacs" to have the normal ctl + r backwards search
    defaultKeymap = "emacs";
    syntaxHighlighting = {
      enable = true; 
      styles = {
        path = "fg=cyan";
      };
    };
  };

  # Git base configuration
  programs.git = {
    enable = true;
    userName = "tobyte";
    userEmail = "mailtobyte@googlemail.com";
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let home manager install and manage itself
  programs.home-manager.enable = true;
}
