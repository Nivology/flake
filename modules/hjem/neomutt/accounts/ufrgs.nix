{
  config,
  pkgs,
  lib,
  ...
}:
let
  xdg.cache = config.xdg.cache.directory;
in
{
  xdg.config.files = {
    "neomutt/accounts/ufrgs/account".text = /* muttrc */ ''
      set folder = "imaps://imap.ufrgs.br/"
      set imap_user = "00288910@ufrgs.br"
      set imap_authenticators = "login"
      set imap_pass = `${lib.getExe pkgs.oo7} lookup application=neomutt email=00288910@ufrgs.br --secret-only`
    '';

    "neomutt/accounts/ufrgs/folder".text = /* muttrc */ ''
      set folder = "imaps://imap.ufrgs.br/"
      set from = "00288910@ufrgs.br"

      set spool_file = +INBOX
      set postponed = +Drafts
      set trash = +Trash

      set header_cache = ${xdg.cache}/neomutt/ufrgs/header
      set message_cache_dir = ${xdg.cache}/neomutt/ufrgs/message
    '';

    "neomutt/accounts/ufrgs/send".text = /* muttrc */ ''
      set real_name = "Felipe Duarte"

      set smtp_url = "smtp://smtp.ufrgs.br/"
      set smtp_user = "00288910@ufrgs.br"
      set smtp_authenticators = "plain"
      set smtp_pass = `${lib.getExe pkgs.oo7} lookup application=neomutt email=00288910@ufrgs.br --secret-only`

      set record = +Sent
    '';
  };
}
