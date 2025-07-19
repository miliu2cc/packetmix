# SPDX-FileCopyrightText: 2025 FreshlyBakedCake
#
# SPDX-License-Identifier: MIT

{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Add your personal packages here
    firefox
    git
    htop
    tree
    wget
    curl
    vim

    wechat-uos
    clash-verge-rev
  ];

  programs.git = {
    enable = true;
    userName = "miliu2cc";
    userEmail = "miliu2cc@gmail.com"; # Replace with your email
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -la";
      la = "ls -A";
      l = "ls -CF";
      grep = "grep --color=auto";
    };
  };
}
