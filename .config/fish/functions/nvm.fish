function nvm
  set -l items nvim nvchad kickstart nvt
  set config (printf "%s\n" $items | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)

  if test -z "$config"
    echo "Nothing selected"
    return 0
  else if test "$config" = "nvim"
    set config ""
  end

  env NVIM_APPNAME="$config" nvim $argv
end
