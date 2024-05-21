{ ... }:

{
  boot.kernel.sysctl = {
    "sysrq_always_enabled" = 1;
    "consoleblank" = 0;
    "pci" = "nomsi";
    "audit" = 0;
    "rd.systemd.show_status" = "auto";
    "rd.udev.log_level" = 3;
  };
}
