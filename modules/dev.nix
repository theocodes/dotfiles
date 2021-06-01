{ config, lib, pkgs, ... }:
{
  # daemon to manage per-project env dependencies
  services.lorri.enable = true;

  environment.systemPackages = with pkgs; [
    # per-project environment loader
    direnv

    # tools
    awscli github-cli kubectl
    exercism insomnia

    # golang
    go_1_16
    goimports gopls godef

    # rust
    rustup rust-analyzer

    # crystal
    crystal shards ameba

    # elixir
    elixir

    # python
    python39
  ];
}
