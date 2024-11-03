{ pkgs, lib, ... }:

{
  programs.ssh.startAgent = lib.mkForce true;
  security.pam.sshAgentAuth.enable = true;

  hardware.gpgSmartcards.enable = true;

  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  #   enableExtraSocket = true;
  #   enableBrowserSocket = true;

  #   pinentryPackage = pkgs.pinentry-gnome3;

    # settings = {
    #   personal-cipher-preferences = "AES256 AES192 AES";
    #   personal-digest-preferences = "SHA512 SHA384 SHA256";
    #   personal-compress-preferences = "ZLIB BZIP2 ZIP Uncompressed";
    #   default-preference-list = "SHA512 SHA384 SHA256 AES256 AES192 AES ZLIB BZIP2 ZIP Uncompressed";
    #   cert-digest-algo = "SHA512";
    #   s2k-digest-algo = "SHA512";
    #   s2k-cipher-algo = "AES256";
    #   charset = "utf-8";
    #   keyserver = "hkps://keys.openpgp.org";
    #   keyid-format = "0xlong";
    #   list-options = "show-uid-validity";
    #   verify-options = "show-uid-validity";
    # };
  # };

  services.pcscd.enable = true;
}
