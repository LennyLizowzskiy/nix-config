{ ... }:

{
  # services.openssh.enable = true;
  # services.openssh.settings.PasswordAuthentication = false;
  programs.ssh.startAgent = true;
  # security.pam.sshAgentAuth.enable = true;
}