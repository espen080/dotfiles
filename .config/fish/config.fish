# no greeting
set fish_greeting

# Environment setup also applies to non-interactive shells.
if test -x /home/linuxbrew/.linuxbrew/bin/brew
    /home/linuxbrew/.linuxbrew/bin/brew shellenv fish | source
end

if test -f "$HOME/.cargo/env.fish"
    source "$HOME/.cargo/env.fish"
else if test -d "$HOME/.cargo/bin"
    fish_add_path --global --path "$HOME/.cargo/bin"
end

# Prepend in this order so later entries have higher priority.
for directory in "$HOME/bin" "$HOME/.local/bin" "$HOME/go/bin" "$HOME/.opencode/bin" "$HOME/miniconda3/bin"
    if test -d "$directory"
        fish_add_path --global --path --move "$directory"
    end
end

if status is-interactive
    # Make less handle non-text files without evaluating shell-specific output.
    if test -x /usr/bin/lesspipe
        set -gx LESSOPEN '| /usr/bin/lesspipe %s'
        set -gx LESSCLOSE '/usr/bin/lesspipe %s %s'
    end

    # Python environments
    alias nvenv='python3 -m venv .venv'
    alias avenv='source .venv/bin/activate.fish'
    alias evenv='deactivate'
    alias ivenv='pip install -r requirements.txt'

    # Directory listings.
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls -CF'

    if command -q eza
        alias ls='eza -lh --group-directories-first --icons=auto'
        alias lsa='ls -a'
        alias lt='eza --tree --level=2 --long --icons --git'
        alias lta='lt -a'
    end

    if command -q rg
        alias grep='rg'
    end

    # Desktop notification after a long-running command: sleep 10; alert
    if command -q notify-send
        function alert
            set -l last_status $status
            set -l icon terminal
            if test $last_status -ne 0
                set icon error
            end
            set -l last_command (history --max=1 | string replace -r '[;&|]\s*alert\s*$' '')
            notify-send --urgency=low -i "$icon" "$last_command"
        end
    end

    # Older fzf releases may not support --fish.
    if command -q fzf
        set -l fzf_init (fzf --fish 2>/dev/null)
        if test $status -eq 0
            printf '%s\n' $fzf_init | source
        end
    end

    if command -q starship
        starship init fish | source
    end
end

# opencode
fish_add_path /home/espen/.opencode/bin
