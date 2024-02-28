local telescope_status, telescope = pcall(require, "telescope")
if not telescope_status then
	return
end

telescope.setup({
    pickers = {
        find_files = {
            theme = "dropdown",
        },
        git_commits = {
            theme = "dropdown",
        },
    }
})
