{ ... }:

{
  # services.openssh.enable = true;
  # services.openssh.settings.PasswordAuthentication = false;
  # programs.ssh.startAgent = true;
  # security.pam.sshAgentAuth.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.pcscd.enable = true;
}