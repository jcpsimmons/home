{
  home-manager = {
    enable = true;
  };

  waybar = {
    enable = true;
  };

  git =
    {
      enable = true;
      userName = "Josh Simmons";
      userEmail = "joshcsimmons@icloud.com";
      extraConfig = {
        core.editor = "code --wait";
        pull.ff = "only";
        init.defaultBranch = "master";
      };
    };

  zsh = {
    enable = true;
    shellAliases = {
      ls = "exa";
      l = "ls -lbF";
      ll = "ls -la";
      llm = "ll --sort=modified";
      la = "ls -lbhHigUmuSa";
      lx = "ls -lbhHigUmuSa@";
      tree = "exa --tree";
      lS = "exa -1";
      fuckdocker = "rm -rf ~/Library/Group\ Containers/group.com.docker && rm -rf ~/Library/Containers/com.docker.docker && rm -rf ~/.docker";
      cdg = "cd $HOME/Documents/github";
      rbm = "git checkout master && git pull && git checkout - && git rebase master";
      showpr = "gh pr view --web";
      tester = "echo tester";
    };
    history = {
      size = 99000;
    };
    initExtra = ''
      function fwd() {
        ssh -L $1\:localhost:$2 $3
      }
      function cf() {
        code $(fzf)
      }
      source ~/.andurilshellconfig
      export NVM_DIR="$HOME/.nvm"
      [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
      [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
    '';
    initExtraFirst = ''
      source ~/.p10k.zsh
    '';
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "jira" "fzf" "ripgrep" ];
      theme = "robbyrussell";
    };
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
      ];
    };
  };
}
