if status is-interactive
    # Commands to run in interactive sessions can go here

    # 取消自动补全
    set -g fish_autosuggestion_enabled 0

    # neofetch快捷键
    abbr s neofetch

    # kitty快捷键
    abbr icat "kitty +kitten icat"

    abbr cd z

    # leetcode 每日提醒
    python /home/mars/utils/leetcode_notifyV2.py &

    if type -q exa
        abbr ls exa
        abbr ll "exa -l -g --icons"
        abbr lla "ll -a"
    end

    # fzf
    fzf --fish | source

    # zoxide 
    zoxide init fish | source
end
