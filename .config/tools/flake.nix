{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: 
  flake-utils.lib.eachDefaultSystem(system:
	let 
		pkgs = nixpkgs.legacyPackages.${system};
	in {
		packages = {
			default = self.packages.${system}.devTools;
			
			devTools = pkgs.buildEnv {
				name = "DevEnv";
				paths = with pkgs; [
					# day 2 day text editor 
					neovim 
					# disk usage in rust
					du-dust
					# rusty `grep`
					ripgrep 
					# rusty `find`
					fd
					# fuzzy finder
					fzf
					# ls replacement 
					eza
					# cat replacement
					bat
					# cd replacement 
					zoxide
					# rm replacement 
					rm-improved
					# terminal multiplexer 
					tmux 
					# preffered shell 
					zsh 
					# js runtime 
					nodejs_21
					# misc
					# resource monitor
					btop
					# dotfile manager 
					stow
					# json query 
					jq 
					# convert dos to unix 
					dos2unix 
					# short man pages 
					tealdeer
                    			# keyboard utilities
                    			wl-clipboard
					# password manager 
					pass
					# process viewer
					procs
				];
			};
		};
	}
	);

}
