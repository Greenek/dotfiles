function fish_prompt --description 'Write out the prompt'
  set -l last_status $status

  echo

  # User
  if [ (whoami) = 'root' ]
    set_color red
  else
    set_color $fish_color_user
  end

  echo -n (whoami)
  set_color normal

  if [ (hostname -s) != 'greenek-mbp' ]
    echo -n '@'

    # Host
    set_color $fish_color_host
    echo -n (hostname -s)
    set_color normal
  end

  echo -n ':'

  # PWD
  echo -n (prompt_pwd)

  set_color brbrown
  __fish_git_prompt
  set_color normal 
        
  echo

  set_color -o normal
 
  if not test $last_status -eq 0
    set_color -o $fish_color_error
  end
    
  echo -n '$ '
  set_color normal  
end
