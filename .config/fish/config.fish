#: init
# fzf --fish | source

#: variables
set -Ux MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -Ux HOMEBREW_PREFIX "opt/homebrew"
set -Ux HOMEBREW_CELLAR "/opt/homebrew/Cellar"
set -Ux HOMEBREW_REPOSITORY "/opt/homebrew"
set -Ux LDFLAGS "-L/opt/homebrew/opt/node@20/lib"
set -Ux CPPFLAGS "-I/opt/homebrew/opt/node@20/include" 
set -Ux EDITOR 'nvim'
set -Ux NVIM_APPNAME 'nvim'
set -Ux NEOVIM_BIN '/opt/homebre/bin/nvim'
set -Ux LC_ALL 'en_US.UTF-8'
set -Ux LANG 'en_US.UTF-8'
set -Ux RANGER_DEVICONS_SEPARATOR " "
set -Ux FZF_COMPLETION_TRIGGER "/"
set -Ux _ZO_ECHO 0
set -Ux Z_CMD "z"
set -Ux FZF_CTRL_T_OPTS "--preview '$show_file_or_dir_preview'"
set -Ux FZF_DEFAULT_OPTS_FILE '/Users/hk_nep/.config/.fzfrc'
set -Ux FZF_ALT_C_OPTS "--preview 'eza --tree --icons --color=always {} | head -200'"
set -Ux HELIX_RUNTIME '/Users/hk_nep/Documents/dev/helix/runtime/'
set -Ux BUN_INSTALL '/Users/hk_nep/.bun/'
set -Ux XDG_CONFIG_HOME '/Users/hk_nep/.config'

#: paths
fish_add_path /usr/local/bin
fish_add_path /Users/hk_nep/go/bin/
fish_add_path /Users/hk_nep/.cargo/bin/
fish_add_path /Users/hk_nep/.local/bin/
fish_add_path /opt/homebrew/opt/node@20/bin
fish_add_path /opt/homebrew/opt/node@20/include
fish_add_path /opt/homebrew/opt/node@20/lib
fish_add_path /opt/homebrew/bin/
fish_add_path /opt/homebrew/sbin/
fish_add_path /opt/homebrew/lib/
fish_add_path /opt/homebrew/include/
fish_add_path /Users/hk_nep/.bun/bin/
fish_add_path /opt/homebrew/lib/ruby/gems/3.3.0/bin/
fish_add_path /Users/hk_nep/.rvm/bin/
fish_add_path /Users/hk_nep/.rubies/ruby-3.3.5/bin/
fish_add_path /usr/bin/
fish_add_path /usr/sbin/
fish_add_path /usr/lib/
fish_add_path /usr/local/bin/
fish_add_path /usr/local/include/
fish_add_path /bin/
fish_add_path /Applications/

setenv PATH "/opt/homebrew/bin:$PATH"

#: abbreviations
abbr --add lf 'lfcd'
abbr --add clr 'set_color --print-colors'
abbr --add tm 'theme.sh -i'
abbr --add dircolors 'gdiroclors'
abbr --add dif 'kitten diff'
abbr --add ls 'colorls --all -x --dark'
abbr --add q 'exit'
abbr --add r "eza -l --all --icons --color=always --time-style iso --time modified --group-directories-first --no-permissions --no-user -h"
abbr --add dot '~/Documents/user/dotfiles/dotdrop.sh'
abbr --add gogh 'bash -c  "$(curl -sLo- https://git.io/vQgMr)"'
abbr --add dw 'w --fuzzy'

#: keymaps 
bind '^[[1;9p' "y\n"
bind '^c' 'return'
bind \e\[101\;9u 'nvm'
bind \e\[100\;9u 'lfcd'
bind -k nul 'clear'

#: theming-defaults 
set -Ux FZF_DEFAULT_OPTS "--color=bg:-1,fg:7,hl:3 --color=bg+:-1,fg+:1,hl+:11 --color=info:3,border:3,prompt:4 --color=pointer:-1,marker:9,spinner:9,header:1"
set -Ux LS_COLORS "*~=0;90:bd=4;33:ca=1;4;37:cd=0;33:di=1;34:do=3;33:ex=1;91:fi=0;37:ln=0;36:mh=4;36:mi=1;37;41:no=0;90:or=0;31:ow=1;37;44:pi=1;4;96:rs=0;37;40:sg=1;4;37:so=1;33:st=4;37;44:su=1;4;37:tw=1;4;37;44:*.1=0;97:*.a=1;36:*.c=0;33:*.d=0;33:*.h=0;33:*.m=0;33:*.o=0;90:*.p=0;33:*.r=0;33:*.t=0;33:*.v=0;33:*.z=1;37:*.7z=1;37:*.ai=0;35:*.as=0;33:*.bc=0;90:*.bz=1;37:*.cc=0;33:*.cp=0;33:*.cr=0;33:*.cs=0;33:*.db=1;37:*.di=0;33:*.el=0;33:*.ex=0;33:*.fs=0;33:*.go=0;33:*.gv=0;33:*.gz=1;37:*.ha=0;33:*.hh=0;33:*.hi=0;90:*.hs=0;33:*.jl=0;33:*.js=0;33:*.ko=1;36:*.kt=0;33:*.la=0;90:*.ll=0;33:*.lo=0;90:*.ma=0;35:*.mb=0;35:*.md=0;97:*.mk=0;37:*.ml=0;33:*.mn=0;33:*.nb=0;33:*.nu=0;33:*.pl=0;33:*.pm=0;33:*.pp=0;33:*.ps=0;32:*.py=0;33:*.rb=0;33:*.rm=0;35:*.rs=0;33:*.sh=0;33:*.so=1;36:*.td=0;33:*.ts=0;33:*.ui=0;32:*.vb=0;33:*.wv=0;35:*.xz=1;37:*FAQ=0;30;101:*.3ds=0;35:*.3fr=0;35:*.3mf=0;35:*.adb=0;33:*.ads=0;33:*.aif=0;35:*.amf=0;35:*.ape=0;35:*.apk=1;37:*.ari=0;35:*.arj=1;37:*.arw=0;35:*.asa=0;33:*.asm=0;33:*.aux=0;90:*.avi=0;35:*.awk=0;33:*.bag=1;37:*.bak=0;90:*.bat=1;36:*.bay=0;35:*.bbl=0;90:*.bcf=0;90:*.bib=0;32:*.bin=1;37:*.blg=0;90:*.bmp=0;35:*.bsh=0;33:*.bst=0;32:*.bz2=1;37:*.c++=0;33:*.cap=0;35:*.cfg=0;32:*.cgi=0;33:*.clj=0;33:*.com=1;36:*.cpp=0;33:*.cr2=0;35:*.cr3=0;35:*.crw=0;35:*.css=0;33:*.csv=0;97:*.csx=0;33:*.cxx=0;33:*.dae=0;35:*.dcr=0;35:*.dcs=0;35:*.deb=1;37:*.def=0;33:*.dll=1;36:*.dmg=1;37:*.dng=0;35:*.doc=0;32:*.dot=0;33:*.dox=0;37:*.dpr=0;33:*.drf=0;35:*.dxf=0;35:*.eip=0;35:*.elc=0;33:*.elm=0;33:*.epp=0;33:*.eps=0;35:*.erf=0;35:*.erl=0;33:*.exe=1;36:*.exr=0;35:*.exs=0;33:*.fbx=0;35:*.fff=0;35:*.fls=0;90:*.flv=0;35:*.fnt=0;37:*.fon=0;37:*.fsi=0;33:*.fsx=0;33:*.gif=0;35:*.git=0;90:*.gpr=0;35:*.gvy=0;33:*.h++=0;33:*.hda=0;35:*.hip=0;35:*.hpp=0;33:*.htc=0;33:*.htm=0;37:*.hxx=0;33:*.ico=0;35:*.ics=0;32:*.idx=0;90:*.igs=0;35:*.iiq=0;35:*.ilg=0;90:*.img=1;37:*.inc=0;33:*.ind=0;90:*.ini=0;32:*.inl=0;33:*.ino=0;33:*.ipp=0;33:*.iso=1;37:*.jar=1;37:*.jpg=0;35:*.jsx=0;33:*.jxl=0;35:*.k25=0;35:*.kdc=0;35:*.kex=0;32:*.kra=0;35:*.kts=0;33:*.log=0;90:*.ltx=0;33:*.lua=0;33:*.m3u=0;35:*.m4a=0;35:*.m4v=0;35:*.mdc=0;35:*.mef=0;35:*.mid=0;35:*.mir=0;33:*.mkv=0;35:*.mli=0;33:*.mos=0;35:*.mov=0;35:*.mp3=0;35:*.mp4=0;35:*.mpg=0;35:*.mrw=0;35:*.msi=1;37:*.mtl=0;35:*.nef=0;35:*.nim=0;33:*.nix=0;32:*.nrw=0;35:*.obj=0;35:*.obm=0;35:*.odp=0;32:*.ods=0;32:*.odt=0;32:*.ogg=0;35:*.ogv=0;35:*.orf=0;35:*.org=0;97:*.otf=0;37:*.otl=0;35:*.out=0;90:*.pas=0;33:*.pbm=0;35:*.pcx=0;35:*.pdf=0;32:*.pef=0;35:*.pgm=0;35:*.php=0;33:*.pid=0;90:*.pkg=1;37:*.png=0;35:*.pod=0;33:*.ppm=0;35:*.pps=0;32:*.ppt=0;32:*.pro=0;37:*.ps1=0;33:*.psd=0;35:*.ptx=0;35:*.pxn=0;35:*.pyc=0;90:*.pyd=0;90:*.pyo=0;90:*.qoi=0;35:*.r3d=0;35:*.raf=0;35:*.rar=1;37:*.raw=0;35:*.rpm=1;37:*.rst=0;97:*.rtf=0;32:*.rw2=0;35:*.rwl=0;35:*.rwz=0;35:*.sbt=0;33:*.sql=0;33:*.sr2=0;35:*.srf=0;35:*.srw=0;35:*.stl=0;35:*.stp=0;35:*.sty=0;90:*.svg=0;35:*.swf=0;35:*.swp=0;90:*.sxi=0;32:*.sxw=0;32:*.tar=1;37:*.tbz=1;37:*.tcl=0;33:*.tex=0;33:*.tga=0;35:*.tgz=1;37:*.tif=0;35:*.tml=0;32:*.tmp=0;90:*.toc=0;90:*.tsx=0;33:*.ttf=0;37:*.txt=0;31:*.typ=0;97:*.usd=0;35:*.vcd=1;37:*.vim=0;33:*.vob=0;35:*.vsh=0;33:*.wav=0;35:*.wma=0;35:*.wmv=0;35:*.wrl=0;35:*.x3d=0;35:*.x3f=0;35:*.xlr=0;32:*.xls=0;32:*.xml=0;97:*.xmp=0;32:*.xpm=0;35:*.xvf=0;35:*.yml=0;32:*.zig=0;33:*.zip=1;37:*.zsh=0;33:*.zst=1;37:*TODO=1:*hgrc=0;37:*.avif=0;35:*.bash=0;33:*.braw=0;35:*.conf=0;32:*.dart=0;33:*.data=0;35:*.diff=0;33:*.docx=0;32:*.epub=0;32:*.fish=0;33:*.flac=0;35:*.h264=0;35:*.hack=0;33:*.heif=0;35:*.hgrc=0;37:*.html=0;37:*.iges=0;35:*.info=0;97:*.java=0;33:*.jpeg=0;35:*.json=0;32:*.less=0;33:*.lisp=0;33:*.lock=0;90:*.make=0;37:*.mojo=0;33:*.mpeg=0;35:*.nims=0;33:*.opus=0;35:*.orig=0;90:*.pptx=0;32:*.prql=0;33:*.psd1=0;33:*.psm1=0;33:*.purs=0;33:*.raku=0;33:*.rlib=0;90:*.sass=0;33:*.scad=0;33:*.scss=0;33:*.step=0;35:*.tbz2=1;37:*.tiff=0;35:*.toml=0;32:*.usda=0;35:*.usdc=0;35:*.usdz=0;35:*.webm=0;35:*.webp=0;35:*.woff=0;37:*.xbps=1;37:*.xlsx=0;32:*.yaml=0;32:*stdin=0;90:*v.mod=0;37:*.blend=0;35:*.cabal=0;33:*.cache=0;90:*.class=0;90:*.cmake=0;37:*.ctags=0;90:*.dylib=1;36:*.dyn_o=0;90:*.gcode=0;33:*.ipynb=0;33:*.mdown=0;97:*.patch=0;33:*.rmeta=0;90:*.scala=0;33:*.shtml=0;37:*.swift=0;33:*.toast=1;37:*.woff2=0;37:*.xhtml=0;37:*Icon\r=0;90:*LEGACY=0;30;101:*NOTICE=0;30;101:*README=0;30;101:*go.mod=0;37:*go.sum=0;90:*passwd=0;32:*shadow=0;32:*stderr=0;90:*stdout=0;90:*.bashrc=0;33:*.config=0;32:*.dyn_hi=0;90:*.flake8=0;37:*.gradle=0;33:*.groovy=0;33:*.ignore=0;37:*.matlab=0;33:*.nimble=0;33:*COPYING=0;90:*INSTALL=0;30;101:*LICENCE=0;90:*LICENSE=0;90:*TODO.md=1:*VERSION=0;30;101:*.alembic=0;35:*.desktop=0;32:*.gemspec=0;37:*.mailmap=0;37:*Doxyfile=0;37:*Makefile=0;37:*TODO.txt=1:*setup.py=0;37:*.DS_Store=0;90:*.cmake.in=0;37:*.fdignore=0;37:*.kdevelop=0;37:*.markdown=0;97:*.rgignore=0;37:*.tfignore=0;37:*CHANGELOG=0;30;101:*COPYRIGHT=0;90:*README.md=0;30;101:*bun.lockb=0;90:*configure=0;37:*.gitconfig=0;37:*.gitignore=0;37:*.localized=0;90:*.scons_opt=0;90:*.timestamp=0;90:*CODEOWNERS=0;37:*Dockerfile=0;32:*INSTALL.md=0;30;101:*README.txt=0;30;101:*SConscript=0;37:*SConstruct=0;37:*.cirrus.yml=0;37:*.gitmodules=0;37:*.synctex.gz=0;90:*.travis.yml=0;37:*INSTALL.txt=0;30;101:*LICENSE-MIT=0;90:*MANIFEST.in=0;37:*Makefile.am=0;37:*Makefile.in=0;90:*.applescript=0;33:*.fdb_latexmk=0;90:*.webmanifest=0;32:*CHANGELOG.md=0;30;101:*CONTRIBUTING=0;30;101:*CONTRIBUTORS=0;30;101:*appveyor.yml=0;37:*configure.ac=0;37:*.bash_profile=0;33:*.clang-format=0;37:*.editorconfig=0;37:*CHANGELOG.txt=0;30;101:*.gitattributes=0;37:*.gitlab-ci.yml=0;37:*CMakeCache.txt=0;90:*CMakeLists.txt=0;37:*LICENSE-APACHE=0;90:*pyproject.toml=0;37:*CODE_OF_CONDUCT=0;30;101:*CONTRIBUTING.md=0;30;101:*CONTRIBUTORS.md=0;30;101:*.sconsign.dblite=0;90:*CONTRIBUTING.txt=0;30;101:*CONTRIBUTORS.txt=0;30;101:*requirements.txt=0;37:*package-lock.json=0;90:*CODE_OF_CONDUCT.md=0;30;101:*.CFUserTextEncoding=0;90:*CODE_OF_CONDUCT.txt=0;30;101:*azure-pipelines.yml=0;37"
set -Ux BAT_THEME 'ansi2'

# sh ~/Documents/dev/tinted-shell/scripts/base16-shadesmear-light.sh


#: theme.sh
# if type -q theme.sh
	# if test -e ~/.theme_history
	# theme.sh (theme.sh -l|tail -n1)
	# end
# end
