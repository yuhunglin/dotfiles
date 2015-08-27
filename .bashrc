export PATH="$HOME/.bin:/usr/local/bin:$HOME/workspace/dotfiles/bin:$PATH"

eval "$(hub alias -s)"
source $(brew --prefix nvm)/nvm.sh

export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv

source /usr/local/bin/virtualenvwrapper.sh

# Make vim the default editor.
export EDITOR='vim';

# Enable persistent REPL history for `node`.
NODE_REPL_HISTORY_FILE=~/.node_history;
# Allow 32³ entries; the default is 1000.
NODE_REPL_HISTORY_SIZE='32768';

# Increase Bash history size. Allow 32³ entries; the default is 500.
export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";
# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';

# Always enable colored `grep` output.
export GREP_OPTIONS='--color=auto';
