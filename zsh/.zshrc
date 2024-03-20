export PATH="/usr/local/bin:$PATH"
export LD_LIBRARY_PATH="/opt/homebrew/opt/llvm/lib:$LD_LIBRARY_PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# Go
export PATH=$PATH:$(go env GOPATH)/bin
export GOPRIVATE=github.com/rain-gg

export CPATH=/opt/homebrew/include
export LIBRARY_PATH=/opt/homebrew/lib

# Load Completions
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ffffff,bold,underline"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)


# Completions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

# FNM
eval "$(fnm env --use-on-cd)"

# Starship
eval "$(starship init zsh)"

# Pyenv
eval "$(pyenv init -)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/bailycase/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/bailycase/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/bailycase/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/bailycase/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# pnpm
export PNPM_HOME="/Users/bailycase/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


# esp IDF
alias export_idf='. $HOME/Developer/esp/v5.1.2/esp-idf/export.sh'

# Color Man Pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
