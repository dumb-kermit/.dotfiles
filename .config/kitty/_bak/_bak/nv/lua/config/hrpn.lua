local harpoon = require "harpoon"
harpoon:setup {}

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers")
        .new({}, {
            --prompt_title = "Harpoon",
            prompt_title = "Sort Files",
            results_title = "Hooked Files",
            preview_title = "File Preview",
            finder = require("telescope.finders").new_table {
                results = file_paths,
            },
            border = true,
            previewer = conf.file_previewer {},
            sorter = conf.generic_sorter {},
        })
        :find()
end

vim.keymap.set("n", "<S-h>", function()
    toggle_telescope(harpoon:list())
end, { desc = " HARPN LIST" })
vim.keymap.set("n", "<leader>=", function()
    harpoon:list():add()
end, { desc = " HARPN MARK" })
vim.keymap.set("n", "<C-Left>", function()
    harpoon:list():prev()
end, { desc = " HARPN PREV" })
vim.keymap.set("n", "<C-Right>", function()
    harpoon:list():next()
end, { desc = " HARPN NEXT" })

vim.keymap.set("n", "<leader>9", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = " HARPN EDIT" })
