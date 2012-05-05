# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="sorin"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx npm vi-mode gerrit lein brew)

source $ZSH/oh-my-zsh.sh
export EDITOR='mvim -f --nomru'

# Customize to your needs...
export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/CrossPack-AVR/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin/:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/opt/local/bin:/usr/local/git/bin:/Users/apage43/android-ndk-r6b/toolchains/arm-linux-androideabi-4.4.3/prebuilt/darwin-x86/bin:/Users/apage43/bin:/Users/apage43/android-sdk-mac_86/platform-tools:/usr/local/bin:/usr/local/Cellar/node/0.1.100/bin:/Users/apage43/stuff/clojurescript/bin


#TMuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# Valgrind
alias vg='valgrind --dsymutil=yes'

# fasd
source ~/lib/fasd/fasd

# Remote Machines

alias crateup='ssh -t crate.im tmux attach'

drop()
    scp -r $1 crate.im:/home/apage43/drop
alias cbnet='sshuttle --dns -r builds.hq.northscale.net 10.0.0.0/8'

alias damien-dev='ssh -t damien-dev.hq.northscale.net tmux attach'

export GOPATH=~/go

export PATH=$PATH:./node_modules/.bin:~/lib/go/bin:$GOPATH/bin
