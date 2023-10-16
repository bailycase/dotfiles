export PATH="/usr/local/bin:$PATH"
export LD_LIBRARY_PATH="/opt/homebrew/opt/llvm/lib:$LD_LIBRARY_PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# Go
export PATH=$PATH:$(go env GOPATH)/bin

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
