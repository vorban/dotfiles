function fish_prompt
	printf '%s%s%s ' (set_color blue) (prompt_pwd) (set_color normal)
	fish_git_prompt
	printf '> '
end
