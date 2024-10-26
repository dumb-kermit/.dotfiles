# Nushell Environment Config File
#
# version = "0.99.2"

#: variables
$env.EDITOR = "/opt/homebrew/bin/nvim"
$env.XDG_CONFIG_HOME = "/Users/hk_nep/.config"
$env.PROPT_INDICATOR = "❯"
$env.NVIM_APPNAME = "nvim"
$env.BAT_THEME = "ansi2"
$env.LC_ALL = "en_US.UTF-8"
$env.LANG = "en_US.UTF-8"
$env.LS_COLORS = (vivid generate /Users/hk_nep/Documents/dev/shell/vivid_colors.yml | str trim)
$env.HOMEBREW_PREFIX = "/opt/homebrew/"
$env.HOMEBREW_CELLAR = "/opt/homebrew/Cellar/"
$env.HOMEBREW_REPOSITORY = "/opt/homebrew/"
$env._ZO_ECHO = "0"
$env.HELIX_RUNTIME = "/Users/hk_nep/Documents/dev/helix/runtime/"
$env.BUN_INSTALL = "/Users/hk_nep/.bun/"
$env.PATH = ($env.PATH | split row (char esep) | prepend '/opt/homebrew/bin')

#: prompt
export def create_left_prompt [] {
    let path_segment = if (is-admin) {
        $"(ansi red_bold)($env.PWD)"
    } else {
        $"(ansi green_bold)($env.PWD)"
    }
    let duration_segment = do {
        let duration_secs = ($env.CMD_DURATION_MS | into int) / 1000
        if ($duration_secs >= 5) {
            $"(ansi yellow_bold)($duration_secs | math round | into string | append "sec" | str join | into duration) "
        } else {
            ""
        }
    }
    let exit_code_segment = if ($env.LAST_EXIT_CODE == 0) {
        ""
    } else {
        $"(ansi red_bold)($env.LAST_EXIT_CODE) "
    }

    [$duration_segment, $exit_code_segment, $path_segment] | str join
}

def create_right_prompt [] {
    # create a right prompt in magenta with green separators and am/pm underlined
    let time_segment = ([
        (ansi reset)
        (ansi magenta)
        (date now | format date '%x %X') # try to respect user's locale
    ] | str join | str replace --regex --all "([/:])" $"(ansi green)${1}(ansi magenta)" |
        str replace --regex --all "([AP]M)" $"(ansi magenta_underline)${1}")

    let last_exit_code = if ($env.LAST_EXIT_CODE != 0) {([
        (ansi rb)
        ($env.LAST_EXIT_CODE)
    ] | str join)
    } else { "" }

    ([$last_exit_code, (char space), $time_segment] | str join)
}

# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = {|| create_left_prompt }
# FIXME: This default is not implemented in rust code as of 2023-09-08.
$env.PROMPT_COMMAND_RIGHT = {|| create_right_prompt }

# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = {|| "> " }
$env.PROMPT_INDICATOR_VI_INSERT = {|| ": " }
$env.PROMPT_INDICATOR_VI_NORMAL = {|| "> " }
$env.PROMPT_MULTILINE_INDICATOR = {|| "::: " }

# If you want previously entered commands to have a different prompt from the usual one,
# you can uncomment one or more of the following lines.
# This can be useful if you have a 2-line prompt and it's taking up a lot of space
# because every command entered takes up 2 lines instead of 1. You can then uncomment
# the line below so that previously entered commands show with a single `🚀`.
# $env.TRANSIENT_PROMPT_COMMAND = {|| "🚀 " }
# $env.TRANSIENT_PROMPT_INDICATOR = {|| "" }
# $env.TRANSIENT_PROMPT_INDICATOR_VI_INSERT = {|| "" }
# $env.TRANSIENT_PROMPT_INDICATOR_VI_NORMAL = {|| "" }
# $env.TRANSIENT_PROMPT_MULTILINE_INDICATOR = {|| "" }
# $env.TRANSIENT_PROMPT_COMMAND_RIGHT = {|| "" }

#: init
zoxide init nushell | save -f ~/.zoxide.nu
