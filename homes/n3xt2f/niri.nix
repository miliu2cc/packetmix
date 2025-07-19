# SPDX-FileCopyrightText: 2025 FreshlyBakedCake
#
# SPDX-License-Identifier: MIT

{ pkgs, ... }:
{
  niri = {
    wallpaper = ./wallpaper.png;
    lockscreen = ./wallpaper.png;
    overviewBackground = ./wallpaper.png;
  };

  home.file.".config/niri/wallpaper.png" = {
    source = ./wallpaper.png;
  };
}
