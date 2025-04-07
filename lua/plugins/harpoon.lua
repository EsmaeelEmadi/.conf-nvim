local harpoon = require("harpoon")

harpoon:setup({})

local map = vim.keymap.set

map("n", "<leader>m", function() harpoon:list():add() end)
map("n", "<leader>ho", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<leader>sh", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })

map("n", "<leader>h0", "<Cmd>:lua require('harpoon.ui').nav_file(0)<CR>", { desc = "go to nth file" })
map("n", "<leader>h1", "<Cmd>:lua require('harpoon.ui').nav_file(1)<CR>", { desc = "go to nth file" })
map("n", "<leader>h2", "<Cmd>:lua require('harpoon.ui').nav_file(2)<CR>", { desc = "go to nth file" })
map("n", "<leader>h3", "<Cmd>:lua require('harpoon.ui').nav_file(3)<CR>", { desc = "go to nth file" })
map("n", "<leader>h4", "<Cmd>:lua require('harpoon.ui').nav_file(4)<CR>", { desc = "go to nth file" })
map("n", "<leader>h5", "<Cmd>:lua require('harpoon.ui').nav_file(5)<CR>", { desc = "go to nth file" })
map("n", "<leader>h6", "<Cmd>:lua require('harpoon.ui').nav_file(6)<CR>", { desc = "go to nth file" })
map("n", "<leader>h7", "<Cmd>:lua require('harpoon.ui').nav_file(7)<CR>", { desc = "go to nth file" })
map("n", "<leader>h8", "<Cmd>:lua require('harpoon.ui').nav_file(8)<CR>", { desc = "go to nth file" })
map("n", "<leader>h9", "<Cmd>:lua require('harpoon.ui').nav_file(9)<CR>", { desc = "go to nth file" })

