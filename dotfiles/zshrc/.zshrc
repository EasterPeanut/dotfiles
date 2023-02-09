# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/opt/python/libexec/bin:$PATH"
export PATH="/usr/local/opt/openssl@3/bin:$PATH"

export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/opt/openssl@3/lib/"

export GIT_EDITOR=nvim

eval "$(direnv hook zsh)"

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

ulimit -n 2048

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history)

. $HOME/.asdf/asdf.sh
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

export KERL_CONFIGURE_OPTIONS="--without-javac --enable-shared-zlib --enable-dynamic-ssl-lib --enable-hipe --enable-smp-support --enable-threads --enable-kernel-poll --enable-wx --with-ssl=$(brew --prefix openssl)"

# export KERL_CONFIGURE_OPTIONS="--without-javac --with-ssl=/usr/local/opt/openssl@3"


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
