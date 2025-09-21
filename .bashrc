source ~/.local/share/omarchy/default/bash/rc

# Setup oh-my-posh prompt
# eval "$(oh-my-posh init bash --config ~/.config/oh-my-posh/themes/emodipt-extend.omp.json)"

# Include Cargo binaries
CARGO_BIN="$HOME/.cargo/bin"

if [[ ":$PATH:" != *":$CARGO_BIN:"* ]]; then
    export PATH="$CARGO_BIN:$PATH"
fi


. "$HOME/.local/share/../bin/env"
. "$HOME/.cargo/env"
