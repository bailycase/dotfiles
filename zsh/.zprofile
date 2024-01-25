# Brew
export PATH="/opt/homebrew/bin:$PATH"

# Go Env
export PATH=$PATH:$(go env GOPATH)/bin

# Aliases
alias vim=nvim

# Globals
export EDITOR=nvim

# Rust/Cargo
#source "$HOME/.cargo/env"

# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
