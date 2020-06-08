# ============= Configuration =============
export BASH_SILENCE_DEPRECATION_WARNING=1
export PATH=".:/usr/local/bin:/usr/local/sbin:$PATH"

# echo "Loading ${HOME}/.bash_profile"
source ~/.profile # get my PATH setup 
source ~/.bashrc  # get my Bash aliases

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi
export PATH="/usr/local/opt/libxml2/bin:$PATH"

fish
