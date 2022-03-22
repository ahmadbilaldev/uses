# Stop Brew from updating everytime 🙄
export HOMEBREW_NO_AUTO_UPDATE=1

# Python env
eval "$(pyenv init -)"

# Flutter
export PATH="$PATH:/Users/ahmadbilal/Flutter-Dev/flutter/bin"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/ahmadbilal/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="shades-of-purple"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Aliases.

alias zco="code ~/.zshrc"
# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"
alias relaod="reload" #typo addressed
alias reld="reload"
alias rld="reload"
alias rf="source ~/.zshrc"

# Create a new directory and cd into it.
# USAGE: mkd new-dir
function mkd() {
	mkdir -p "$@" && cd "$@"
}

# VSCode open folder
alias co="code ."

# VSCodeInsider open folder
alias coi="code-insiders ."

# Easier directory navigation.
alias ~="cd ~"
alias .="cd .."
alias ..="cd ../.."
alias ...="cd ../../.."
alias ....="cd ../../../.."
alias cd..="cd .." # Typo addressed.


# Create a Symlink and dump its alias to paths.
# lns () {
# 	THE_PWD=$PWD
# 	cd ~
# 	ln -s $THE_PWD $1
# 	echo "alias $1='cd ~ ; cd $1'" >> ~/Dropbox/bin/.paths
# 	source ~/Dropbox/bin/.paths
# 	cd $1
# 	echo "✅ DONE!"
# }

# npm.
alias ns="npm start"
alias nb="npm run build"
alias nrs="npm run serve"
alias nrd="npm run dev"
alias nbs="npm run build && npm run serve"
alias nrr="npm run release"
alias nrt="npm run test"
alias nt="npm test"
alias ys="yarn start"
alias yb="yarn build"


function nbin { (PATH=$(npm bin):$PATH; eval $@;) }

# MongoDB Aliases
alias startmongo="brew services start mongodb/brew/mongodb-community"
alias stopmongo="brew services stop mongodb/brew/mongodb-community"
# Doesn't run in background and after restart:
alias startoncemongo="mongod --config /usr/local/etc/mongod.conf"


#.# Better Git Logs.
alias gconfig="git config --global --edit"
### Using EMOJI-LOG (https://github.com/ahmadawais/Emoji-Log).

# Create a new repository, clone it and push the first commit
function ghinitold() {
  NAME=$1
  TYPE=$2

  echo "Creating Repository"

  gh re --new "$NAME" --type "$TYPE"
  gh re --clone --repo "$NAME"

  cd "$NAME"
  echo "# $NAME" >> README.md

  git add .
  git commit -m "📦 NEW: First Commit"
  git push
  echo ''
  echo "✅ Done: https:github.com/AhmadBilalDev/$NAME"
  echo ''
}

# GH New repo.
function ghinit() {
	echo "\n${yf}❯ Creating the GitHub Repo in PWD…${r}\n"
	gh re --new "$1" --description "$2" --type "$3"
	gh re --user "ahmadawais" --repo "$1" --clone
	cd "$1"
	addgitignore
	echo "# $1 \n\n > $2" >> readme.md
	gnew 'First commit'
	echo "\n${gf}✅ DONE! Repo → https://github.com/ahmadbilaldev/$1${r}\n"
}

# GH New repo private.
function ghinitp() {
	ghinit "$1" "$2" "private"
}

# Git Commit, Add all and Push — in one step.
function gcap() {
    git commit -m "$*" && git push
}

# NEW.
function gnew() {
    gcap "📦 NEW: $@"
}

# IMPROVE.
function gimp() {
    gcap "👌 IMPROVE: $@"
}

# FIX.
function gfix() {
    gcap "🐛 FIX: $@"
}

# RELEASE.
function grlz() {
    gcap "🚀 RELEASE: $@"
}

# DOC.
function gdoc() {
    gcap "📖 DOC: $@"
}

# TEST.
function gtst() {
    gcap "✅ TEST: $@"
}

function gtagit() {
	git tag $@
	git push origin --tags
}

function wprlz() {
	grlz $@
	gtagit $@
}
# Open uni folder
alias uni="cd Documents/Uni/"
# Open the work folder
alias work="cd Documents/Work"
# devrel-examples folder
alias dex="cd Documents/Work/devrel-examples-external"
# devrel-stack folder
alias des="cd Documents/Work/devrel-stack-data/"
# Open the current directory in finder
alias fo="open ."
# Type `git open` to open the GitHub page or website for a repository.
# npm install -g git-open
alias gio="git open"

# Alis for git clone.
alias gco="git clone"

# Easy Remove (I know what I am doing)
function rmv() {
 rm -rf "$@"
}
# Dowload best youtube video print
function ytbest() {
 youtube-dl -f 'bestvideo[height<=1080,ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "$@" -o '%(title)s.%(ext)s'
}
