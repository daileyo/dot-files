PS1='\n'                                        # new line
PS1="$PS1"'\[\033[33m\e[100m\]'                 # change to blue
PS1="$PS1"'\D{[%F] }\[\033[35m\]\D{%T}'         # add date and time
PS1="$PS1"'\[\033[40m\]'
PS1="$PS1"'\n'                                  # new line
PS1="$PS1"'\[\033[32m\]'                        # change to green
PS1="$PS1"'\u@\h '                              # user@host<space>
PS1="$PS1"'\[\033[35m\]'                        # change to purple
PS1="$PS1"'\[\033[33m\]'                        # change to brownish yellow
PS1="$PS1"'\w'                                  # current working directory
                                                #git specific
PS1="$PS1"'\[\033[36m\]'                        # change color to cyan
PS1="$PS1"'`__git_ps1`'                         # bash function
                                                #end git specific
PS1="$PS1"'\[\033[0m\]'                         # change color
PS1="$PS1"'\n'                                  # new line
PS1="$PS1"'$ '                                  # prompt: always $
