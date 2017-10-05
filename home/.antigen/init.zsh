#-- START ZCACHE GENERATED FILE
#-- GENERATED: Wed Oct  4 15:05:35 CEST 2017
#-- ANTIGEN v2.2.1
_antigen () {
	local -a _1st_arguments
	_1st_arguments=('apply:Load all bundle completions' 'bundle:Install and load the given plugin' 'bundles:Bulk define bundles' 'cleanup:Clean up the clones of repos which are not used by any bundles currently loaded' 'cache-gen:Generate cache' 'init:Load Antigen configuration from file' 'list:List out the currently loaded bundles' 'purge:Remove a cloned bundle from filesystem' 'reset:Clears cache' 'restore:Restore the bundles state as specified in the snapshot' 'revert:Revert the state of all bundles to how they were before the last antigen update' 'selfupdate:Update antigen itself' 'snapshot:Create a snapshot of all the active clones' 'theme:Switch the prompt theme' 'update:Update all bundles' 'use:Load any (supported) zsh pre-packaged framework') 
	_1st_arguments+=('help:Show this message' 'version:Display Antigen version') 
	__bundle () {
		_arguments '--loc[Path to the location <path-to/location>]' '--url[Path to the repository <github-account/repository>]' '--branch[Git branch name]' '--no-local-clone[Do not create a clone]'
	}
	__list () {
		_arguments '--simple[Show only bundle name]' '--short[Show only bundle name and branch]' '--long[Show bundle records]'
	}
	__cleanup () {
		_arguments '--force[Do not ask for confirmation]'
	}
	_arguments '*:: :->command'
	if (( CURRENT == 1 ))
	then
		_describe -t commands "antigen command" _1st_arguments
		return
	fi
	local -a _command_args
	case "$words[1]" in
		(bundle) __bundle ;;
		(use) compadd "$@" "oh-my-zsh" "prezto" ;;
		(cleanup) __cleanup ;;
		(update|purge) compadd $(type -f \-antigen-get-bundles &> /dev/null || antigen &> /dev/null; -antigen-get-bundles --simple 2> /dev/null) ;;
		(theme) compadd $(type -f \-antigen-get-themes &> /dev/null || antigen &> /dev/null; -antigen-get-themes 2> /dev/null) ;;
		(list) __list ;;
	esac
}
antigen () {
  local MATCH MBEGIN MEND
  [[ "$ZSH_EVAL_CONTEXT" =~ "toplevel:*" || "$ZSH_EVAL_CONTEXT" =~ "cmdarg:*" ]] && source "/nix/store/2z1an5dzislx8w8630778915kfjn6h2x-antigen-1d212d1/antigen.zsh" && eval antigen $@;
  return 0;
}
typeset -gaU fpath path
fpath+=(/home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/lib /home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git /home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git-extras /home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/cabal /home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/sbt /home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/scala /home/maiksen/.antigen/bundles/zsh-users/zsh-syntax-highlighting) path+=(/home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/lib /home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git /home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git-extras /home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/cabal /home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/sbt /home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/scala /home/maiksen/.antigen/bundles/zsh-users/zsh-syntax-highlighting)
_antigen_compinit () {
  autoload -Uz compinit; compinit -d "/home/maiksen/.antigen/.zcompdump"; compdef _antigen antigen
  add-zsh-hook -D precmd _antigen_compinit
}
autoload -Uz add-zsh-hook; add-zsh-hook precmd _antigen_compinit
compdef () {}

if [[ -n "/home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh" ]]; then
  ZSH="/home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh"; ZSH_CACHE_DIR="/home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/cache/"
fi
#--- BUNDLES BEGIN
source '/home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/lib/bzr.zsh';
source '/home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/lib/clipboard.zsh';
source '/home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/lib/compfix.zsh';
source '/home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/lib/completion.zsh';
source '/home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/lib/correction.zsh';
source '/home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/lib/diagnostics.zsh';
source '/home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/lib/directories.zsh';
source '/home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/lib/functions.zsh';
source '/home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/lib/git.zsh';
source '/home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/lib/grep.zsh';
source '/home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/lib/history.zsh';
source '/home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/lib/key-bindings.zsh';
source '/home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/lib/misc.zsh';
source '/home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/lib/nvm.zsh';
source '/home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/lib/prompt_info_functions.zsh';
source '/home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/lib/spectrum.zsh';
source '/home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/lib/termsupport.zsh';
source '/home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/lib/theme-and-appearance.zsh';
source '/home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git/git.plugin.zsh';
source '/home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git-extras/git-extras.plugin.zsh';
source '/home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/cabal/cabal.plugin.zsh';
source '/home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/sbt/sbt.plugin.zsh';
source '/home/maiksen/.antigen/bundles/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh';
source '/home/maiksen/.antigen/bundles/robbyrussell/oh-my-zsh/themes/bira.zsh-theme';

#--- BUNDLES END
typeset -gaU _ANTIGEN_BUNDLE_RECORD; _ANTIGEN_BUNDLE_RECORD=('https://github.com/robbyrussell/oh-my-zsh.git lib plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/git plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/git-extras plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/cabal plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/sbt plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/scala plugin true' 'https://github.com/zsh-users/zsh-syntax-highlighting.git / plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git themes/bira.zsh-theme theme true')
typeset -g _ANTIGEN_CACHE_LOADED; _ANTIGEN_CACHE_LOADED=true
typeset -g ANTIGEN_CACHE_VERSION; ANTIGEN_CACHE_VERSION='v2.2.1'

#-- END ZCACHE GENERATED FILE
