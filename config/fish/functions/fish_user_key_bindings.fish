function fish_user_key_bindings
    ### fzf ###
    bind \ct '__fzf_ctrl_t'
    bind \cr '__fzf_ctrl_r'
    bind \cx '__fzf_ctrl_x'
    bind \ec '__fzf_alt_c'
    if bind -M insert >/dev/null ^/dev/null
        bind -M insert \ct '__fzf_ctrl_t'
        bind -M insert \cr '__fzf_ctrl_r'
        bind -M insert \cx '__fzf_ctrl_x'
        bind -M insert \ec '__fzf_alt_c'
    end
    ### fzf ###
    ### sudope ###
    set -q sudope_sequence
    or set -l sudope_sequence \cs
    test (bind | grep -q '[[:space:]]sudope$')
    or set -l do_bind
    if test (bind $sudope_sequence ^/dev/null)
        echo "sudope: The requested sequence is already in use:" (bind $sudope_sequence | cut -d' ' -f2-)
    else if set -q do_bind
        bind $sudope_sequence sudope
    end
    ### sudope ###
    ### bang-bang ###
    bind ! __history_previous_command
    bind '$' __history_previous_command_arguments
    ### bang-bang ###
end
