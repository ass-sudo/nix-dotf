{ config, pkgs, ... }:

{
  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = 1;
    "net.ipv6.conf.all.forwarding" = 1;
  };
  
  networking.nftables.enable = true;
  networking.firewall.enable = true;
  networking.firewall.checkReversePath = false;

  environment.systemPackages = with pkgs; [
    nftables
    gawk
    iptables
    ipset
    iproute2
    psmisc
  ];
}
