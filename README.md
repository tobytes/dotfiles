How to use
========

Clone it

```
    git clone git@github.com:tobytes/dotfiles.git ~/.dotfiles
```

Rebuild & switch
```
nixos-rebuild switch --flake ~/.dotfiles/nix-config/#<hostname> --use-remote-sudo
```
