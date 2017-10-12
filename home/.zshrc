if [ -f ${HOME}/.antigen/antigen.zsh ]; then
    source ${HOME}/.antigen/antigen.zsh
else
    mkdir ~/.antigen
    curl -L git.io/antigen > antigen.zsh
    source ${HOME}/.antigen/antigen.zsh
fi

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme bira
# Tell Antigen that you're done.
antigen apply

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# User configuration

export PATH=$HOME/bin:/usr/local/bin:/usr/local/lib:$PATH

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

if [ -d ${HOME}/.ssh ]; then
    if [ -f ${HOME}/.ssh/environment ]; then
	SSH_ENV="${HOME}/.ssh/environment"
    else
	touch ${HOME}/.ssh/environment
    fi # end if .ssh/environment exists

    function start_agent {
	echo "Initialising new SSH agent..."
	ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
	echo succeeded
	chmod 600 "${SSH_ENV}"
	. "${SSH_ENV}" > /dev/null
	ssh-add;
	if [ -f ~/.ssh/id_rsa_lfnet ]; then
	    ssh-add ~/.ssh/id_rsa_lfnet;
	fi
	
	if [ -f ~/.ssh/id_rsa_github ]; then
	    ssh-add ~/.ssh/id_rsa_github;
	fi
	
	if [ -f ~/.ssh/id_rsa_macke ]; then
	    ssh-add ~/.ssh/id_rsa_macke;
	fi
	
	if [ -f ~/.ssh/id_rsa_bitbucket ]; then
	    ssh-add ~/.ssh/id_rsa_bitbucket;
	fi
    }

    # Source SSH settings, if applicable

    if [ -f "${SSH_ENV}" ]; then
	. "${SSH_ENV}" > /dev/null
	#ps ${SSH_AGENT_PID} doesn't work under cywgin
	ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
	    start_agent;
	}
    else
	start_agent;
    fi # end if ssh env exists
fi # end if .ssh exists

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

if [ -f ~/credentials.sh ]; then
    source ~/credentials.sh
fi

export WORKON_HOME=~/.virtualenvs
export PROJECT_HOME=~/Devel
source /usr/local/bin/virtualenvwrapper.sh

export JAVA_HOME=/usr/lib/jvm/default-java

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/maiksen/.sdkman"
[[ -s "/home/maiksen/.sdkman/bin/sdkman-init.sh" ]] && source "/home/maiksen/.sdkman/bin/sdkman-init.sh"
