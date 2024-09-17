# 这是一个简单的提示符，格式如下
# mars:/last-dir (branch) $
function fish_prompt
    # 设置提示符符号和颜色
    set -l symbol '$'
    set -l color blue --bold

    # 检查是否是 root 用户，root 用户使用 '#'
    if fish_is_root_user
        set symbol '#'
        set -q fish_color_cwd_root
        and set color $fish_color_cwd_root
    end

    # 显示用户名（白色加粗）
    set_color white --bold
    echo -n "$USER:"

    # 显示当前路径中的最后一个目录，替换主目录为 ~
    set_color $color
    set -l current_dir (pwd)
    set -l display_dir (string replace "$HOME" '~' $current_dir)
    echo -n (basename $display_dir)"/"

    # 如果在 Git 仓库中，显示当前分支及其状态
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1
        set -l branch (git symbolic-ref --short HEAD 2>/dev/null)

        if test -n "$branch"
            # 设置状态指示符：未暂存修改'✗'，已暂存修改'+'
            set -l status_indicator ''
            git diff --quiet 2>/dev/null; or set status_indicator '✗'
            git diff --cached --quiet 2>/dev/null; or set status_indicator '+'

            # 显示分支和状态信息
            set_color blue
            echo -n " ("

            set_color yellow --bold
            echo -n "$branch"

            if test "$status_indicator" = '✗'
                set_color red --bold
            else if test "$status_indicator" = '+'
                set_color green --bold
            end
            echo -n "$status_indicator"

            set_color blue
            echo -n ")"
        end
    end

    # 重置颜色并显示提示符符号
    set_color normal
    echo -n " $symbol "
end
