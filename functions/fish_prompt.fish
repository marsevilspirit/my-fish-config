# 这是一个简单的提示符，格式如下
# mars:/last-dir (branch) $
function fish_prompt

    function _repo_branch_name
        _$argv[1]_branch_name
    end

    set -l cyan (set_color -o cyan)
    set -l yellow (set_color -o yellow)
    set -l red (set_color -o red)
    set -l blue (set_color -o blue)
    set -l normal (set_color normal)
    set -l white (set_color -o white --bold)

    set -l name $white(whoami)
    set -l cwd $cyan(basename (prompt_pwd))/

    set -l repo_info
    if set -l repo_type (_repo_type)
        set -l repo_branch $yellow(_repo_branch_name $repo_type)
        if _is_repo_dirty $repo_type
            set -l dirty "$red✗"
            set repo_info "$blue($repo_branch$dirty$blue)"
        else
            set repo_info "$blue($repo_branch$blue)"
        end
    end

    set -l dollar "$normal\$"  

    echo -n -s "$name:$cwd $repo_info $dollar "
end
