# SPDX-FileCopyrightText: 2025 FreshlyBakedCake
#
# SPDX-License-Identifier: MIT
{pkgs, ...}:
{
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;
}
