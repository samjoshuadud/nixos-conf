{ pkgs, ... }:
{
  hardware.bluetooth.enable = true;
  hardware.firmware = [ pkgs.linux-firmware ];
}
