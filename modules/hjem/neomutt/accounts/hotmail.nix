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
    "neomutt/accounts/hotmail/account".text = /* muttrc */ ''
      set folder = "imaps://outlook.office365.com/"
      set imap_user = "felipesdrs@hotmail.com"
      set imap_authenticators = "xoauth2"
      set imap_oauth_refresh_command = "${lib.getExe pkgs.ortie} token show --account hotmail"

      set spool_file = +Inbox
    '';

    "neomutt/accounts/hotmail/folder".text = /* muttrc */ ''
      set folder = "imaps://outlook.office365.com/"
      set from = "felipesdrs@hotmail.com"

      set spool_file = +Inbox
      set postponed = +Drafts
      set trash = +Deleted

      set header_cache = ${xdg.cache}/neomutt/hotmail/header
      set message_cache_dir = ${xdg.cache}/neomutt/hotmail/message
    '';

    "neomutt/accounts/hotmail/send".text = /* muttrc */ ''
      set real_name = "Felipe Duarte"

      set smtp_url = "smtp://smtp.office365.com/"
      set smtp_user = "felipesdrs@hotmail.com"
      set smtp_authenticators = "xoauth2"
      set smtp_oauth_refresh_command = "${lib.getExe pkgs.ortie} token show --account hotmail"

      set record = +Sent
    '';
  };
}
