# SPDX-FileCopyrightText: 2025 FreshlyBakedCake
#
# SPDX-License-Identifier: MIT

{ project, system, ... }:
{
  programs.helix = {
    enable = true;
    package = project.packages.helix.result.${system};
    
    settings = {
      theme = "catppuccin_mocha";
      
      editor = {
        line-number = "relative";
        mouse = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        file-picker = {
          hidden = false;
        };
        auto-save = true;
        completion-trigger-len = 2;
        true-color = true;
      };
    };
  };
}