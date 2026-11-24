{ config, pkgs, ... }:
let
  xdg.config = config.xdg.config.directory;
in
{
  packages = builtins.attrValues { inherit (pkgs) neomutt; };

  xdg.config.files."neomutt/neomuttrc".text = /* muttrc */ ''
    account-hook outlook.office365.com "set my_host = hotmail"
    account-hook imap.ufrgs.br "set my_host = ufrgs"
    account-hook . "source accounts/$my_host/account"

    named-mailboxes "Hotmail/Caixa de Entrada" "imaps://outlook.office365.com/Inbox"
    named-mailboxes "Hotmail/Arquivo Morto" "imaps://outlook.office365.com/Arquivo Morto"
    named-mailboxes "Hotmail/Lixeira" "imaps://outlook.office365.com/Deleted"
    named-mailboxes "Hotmail/Rascunhos" "imaps://outlook.office365.com/Drafts"
    named-mailboxes "Hotmail/Enviados" "imaps://outlook.office365.com/Sent"
    named-mailboxes "Hotmail/Lixo Eletrônico" "imaps://outlook.office365.com/Junk"
    named-mailboxes "UFRGS/Caixa de Entrada" "imaps://imap.ufrgs.br/INBOX"
    named-mailboxes "UFRGS/Arquivo Morto" "imaps://imap.ufrgs.br/Arquivo Morto"
    named-mailboxes "UFRGS/Lixeira" "imaps://imap.ufrgs.br/Trash"
    named-mailboxes "UFRGS/Rascunhos" "imaps://imap.ufrgs.br/Drafts"
    named-mailboxes "UFRGS/Enviados" "imaps://imap.ufrgs.br/Sent"
    named-mailboxes "UFRGS/Lixo Eletrônico" "imaps://imap.ufrgs.br/Spam"

    folder-hook outlook.office365.com "set my_host = hotmail"
    folder-hook imap.ufrgs.br "set my_host = ufrgs"
    folder-hook . "source accounts/$my_host/folder"

    send-hook ~P "source accounts/$my_host/send"

    set mailcap_path = "${xdg.config}/neomutt/mailcap"

    ignore *
    unignore subject: from: to: cc: date:
    hdr_order subject: from: to: cc: date:

    alternative_order text/html text/*

    set mail_check_stats
    set imap_condstore
    set imap_qresync
    set imap_idle
    set implicit_auto_view
    set use_threads = threads
    set sort = reverse-last-date
    set sort_browser = unsorted
    set delete = yes
    set nomarkers

    source keybinds
    source style
  '';
}
