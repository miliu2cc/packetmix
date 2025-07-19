# SPDX-FileCopyrightText: 2025 FreshlyBakedCake
#
# SPDX-License-Identifier: MIT

{ pkgs, lib, ... }:
let
nerdFonts = with pkgs.nerd-fonts; [
  # fonts name can get in `https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/data/fonts/nerdfonts/shas.nix`
  hack
  jetbrains-mono
  iosevka
  daddy-time-mono
  symbols-only
];
in
{
  fonts = {
    fontconfig = {
            enable = true;
            defaultFonts = {

            emoji = ["Noto Color Emoji"];

            serif = [
              "Noto Serif CJK SC"
              "Noto Serif"
            ];
            sansSerif = [

              "Noto Sans CJK SC"
              "Moto Sans"
            ];
            monospace = [

              "Noto Sans Mono CJK SC"
            ];
            };

          };

          #

          packages = with pkgs; [
            material-symbols
            material-icons
            noto-fonts
            noto-fonts-cjk-sans
            noto-fonts-cjk-serif
            noto-fonts-color-emoji

          ]
          ++ nerdFonts;
  };
}
