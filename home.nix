{ config, pkgs, ... }:

{
  home.username = "hal9000";
  home.homeDirectory = "/home/hal9000";

  # State version.
  home.stateVersion = "26.05";

  # Packages to install
  home.packages = with pkgs; [
	gh
	docker
	code-cursor
        proton-pass
        proton-pass-cli 
        opencode
        python314Packages.uv   
  ];

  # Basic Git configuration managed directly by Home Manager
  programs.git = {
    enable = true;
    settings.user = {
    	name = "Ahmed Troudi";
    	email = "ahmed.troudi.fst@gmail.com";
    };
  };

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;
}
