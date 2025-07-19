# SPDX-FileCopyrightText: 2025 FreshlyBakedCake
#
# SPDX-License-Identifier: MIT

# packetmix.nix: packetmix support configuration, including our binary cache and auto-updating
{ config, pkgs, ... }:
{
  nix.settings.substituters = [
    "https://freshlybakedcake.cachix.org"
    "https://cache.nixos.org"
  ];
  nix.settings.trusted-public-keys = [
    "freshlybakedcake.cachix.org-1:YmhsHdeKjqbaS33PPJXJllTHBupT3hliQrPcllJXkE0="
  ];

  system.autoUpgrade = {
    enable = true;
    operation = "boot"; # The default is "switch", but that can lead to some nasty inconsistencies - boot is cleaner
    flags = [
      "-f"
      "/home/n3xt2f/packetmix/nilla.nix"
      "-A"
      "systems.nixos.${config.networking.hostName}.result"
    ];
  };

  systemd.services.nixos-upgrade.preStart = ''
    ${pkgs.networkmanager}/bin/nm-online -s -q # wait until the internet is online, as esp. if we go offline we need to wait to retry...
    cd /home/n3xt2f/packetmix
    ${pkgs.git}/bin/git fetch
    ${pkgs.git}/bin/git checkout packetmix/main
  '';

  systemd.services.nixos-upgrade.serviceConfig = {
    Restart = "on-failure";
    RestartSec = 5;
    RestartSteps = 5;
    RestartMaxDelaySec = 86400;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05";
}
