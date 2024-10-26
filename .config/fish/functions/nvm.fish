function nvm
  set -l items nvim nvchad kickstart
  set config (printf "%s\n" $items | gum choose)

  if test -z "$config"
    echo "Nothing selected"
    return 0
  else if test "$config" = "nvim"
    set config ""
  end

  env NVIM_APPNAME="$config" nvim $argv
end
