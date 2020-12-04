function fish_git_prompt
    # IF THIS IS NOT A GIT REPO, RETURN
    set is_git (git rev-parse --is-inside-work-tree 2>/dev/null)
    if test "$is_git" != true
        return
    end

    printf '['
    # PRINT CURRENT BRANCH
    printf '%s%s%s' (set_color yellow) (git branch --show-current) (set_color normal)
    
    # PRINT LATEST TAGS
    tags
    # STATUS

    printf '] '
end

function tags
    set prod_tag (git tag | grep prod | sort -V | tail -n 1)
    set demo_tag (git tag | grep demo | sort -V | tail -n 1)
    set release_tag (git tag | grep release | sort -V | tail -n 1)
    
    if test -n "$prod_tag" -o -n "$demo_tag" -o -n "$release_tag"
        printf ' | '
    end
    if test -n "$prod_tag"
        print_tag $prod_tag
    end
    if test -n "$demo_tag"
        print_tag $demo_tag
    end
    if test -n "$release_tag"
        print_tag $release_tag
    end
end

function print_tag --argument-names tag
    printf "{%s$tag%s}" (set_color green) (set_color normal)
end