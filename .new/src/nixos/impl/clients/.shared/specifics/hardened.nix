{ lib, pkgs, ... }:

{
  # systemd.coredump.enable = false;

  security = {
    chromiumSuidSandbox.enable = true;
  };

  programs.firejail.enable = true;

  services.opensnitch = {
    enable = true;
  };

  # environment = {
  #   memoryAllocator.provider = "scudo";
  #   variables.SCUDO_OPTIONS = "ZeroContents=1";
  # };

  boot = {
    tmp.cleanOnBoot = true;

    kernel.sysctl = {
      "kernel.unpriviliged_bpf_disabled" = 1;

      # Disable bpf() JIT (to eliminate spray attacks)
      "net.core.bpf_jit_enable" = false;

      # Hide kptrs even for processes with CAP_SYSLOG`
      "kernel.kptr_restrict" = 2;

      # Enable strict reverse path filtering (that is, do not attempt to route
      # packets that "obviously" do not belong to the iface's network; dropped
      # packets are logged as martians).
      "net.ipv4.conf.all.log_martians" = true;
      "net.ipv4.conf.all.rp_filter" = "1";
      "net.ipv4.conf.default.log_martians" = true;
      "net.ipv4.conf.default.rp_filter" = "1";

      # Ignore broadcast ICMP (mitigate SMURF)
      "net.ipv4.icmp_echo_ignore_broadcasts" = true;

      # Ignore outgoing ICMP redirects (this is ipv4 only)
      "net.ipv4.conf.all.send_redirects" = false;
      "net.ipv4.conf.default.send_redirects" = false;
    };

    kernelParams = [
      # Video driver settings
      "i915.enable_guc=1"
      "pci=assign-busses,hpbussize=0x33,realloc"

      # Security settings
      "debugfs=off"
      "page_alloc.shuffle=1"
      "page_poison=1"
      "slab_nomerge"
    ];

    initrd.availableKernelModules = [
      "xhci_pci"
      "thunderbolt"
      "vmd"
      "nvme"
      "usb_storage"
      "sd_mod"
    ];
  };
}
