{ config, pkgs, inputs, ... }:

{
  home.username = "hal9000";
  home.homeDirectory = "/home/hal9000";

  # State version.
  home.stateVersion = "26.05";

  # Packages to install
  home.packages = with pkgs; [
	vim
	wget
	htop
	gh
	docker
	vscode
        proton-pass
        proton-pass-cli 
        inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.opencode2
        python314Packages.uv
        fastfetch  
        zip
        neovim
  ];

  # Basic Git configuration managed directly by Home Manager
  programs.git = {
    enable = true;
    settings.user = {
    	name = "Ahmed Troudi";
    	email = "ahmed.troudi.fst@gmail.com";
    };
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = "set -g fish_greeting ''";
  };

  programs.alacritty = {
    enable = true;
    settings = {
      shell.program = "fish";
      font.size = 12;
      window.opacity = 0.95;
    };
  };

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;
}

