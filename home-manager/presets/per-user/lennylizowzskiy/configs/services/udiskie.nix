{ ... }:

{
  services.udiskie = {
    enable = true;
    automount = true;
    notify = false;
    tray = "never";
  };
}
