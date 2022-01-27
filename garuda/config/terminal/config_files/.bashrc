#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias cls='clear && paleofetch'
PS1='\e[1;92m\n ╭─\u@\h \e[1;97min \e[1;94m\w\n\e[1;92m ╰─λ \e[1;97m'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/thanh/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/thanh/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/thanh/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/thanh/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
paleofetch
# <<< conda initialize <<<

