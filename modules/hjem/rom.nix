{ pkgs, ... }: {
  xdg.config.files."rom/config.toml" = {
    generator = (pkgs.formats.toml { }).generate "rom-config.toml";
    value = {
      summary = "full";
      tree-direction = "up";
    };
  };
}
