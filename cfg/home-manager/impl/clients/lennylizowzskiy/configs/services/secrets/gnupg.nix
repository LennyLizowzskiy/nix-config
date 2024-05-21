{ extraArgs, ... }:

{
  programs.gpg = {
    enable = true;
    # homedir = "${config.home.homeDirectory}/.config/gnupg";

    publicKeys = [ { source = "${extraArgs.keysDir}/pgp-public.asc"; } ];

    scdaemonSettings = {
      disable-ccid = true;
    };

    settings = {
      personal-cipher-preferences = "AES256 AES192 AES";
      personal-digest-preferences = "SHA512 SHA384 SHA256";
      personal-compress-preferences = "ZLIB BZIP2 ZIP Uncompressed";
      default-preference-list = "SHA512 SHA384 SHA256 AES256 AES192 AES ZLIB BZIP2 ZIP Uncompressed";
      cert-digest-algo = "SHA512";
      s2k-digest-algo = "SHA512";
      s2k-cipher-algo = "AES256";
      charset = "utf-8";
      no-comments = true;
      no-emit-version = true;
      no-greeting = true;
      keyid-format = "0xlong";
      list-options = "show-uid-validity";
      verify-options = "show-uid-validity";
      "with-fingerprint" = true;
      require-cross-certification = true;
      armor = true;
      use-agent = true;
      keyserver = "hkps://keys.openpgp.org";
    };
  };
}
