if status is-interactive
    # Commands to run in interactive sessions can go here

    # 取消自动补全
    set -g fish_autosuggestion_enabled 0

    # leetcode 每日提醒
    python /home/mars/utils/leetcode_notifyV2.py &
end
