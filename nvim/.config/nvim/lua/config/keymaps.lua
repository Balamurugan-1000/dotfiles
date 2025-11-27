local map = vim.keymap.set
local opts = { noremap = true, silent = true }

----------------------------------------------------------------------
-- Core
----------------------------------------------------------------------

map("n", "<leader>;", function() Snacks.dashboard() end, opts)
map("n", "<leader>w", "<cmd>w<CR>", opts)
map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", opts)
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", opts)

-- Select all
map("n", "<C-a>", "ggVG", opts)

-- Clear search
map("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)
map("n", "<ESC><ESC>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
map("n", "<leader>nh", "<cmd>nohl<CR>", { desc = "Clear search highlights" })

-- Persistent buffer
map("n", "<leader>se", "<cmd>e ~/scratch.txt<CR>", { desc = "Open persistent buffer" })

-- Disable accidental leader spam
map("n", "<leader><leader>", "<nop>", opts)

----------------------------------------------------------------------
-- Editing Behavior
----------------------------------------------------------------------

map("i", "jj", "<ESC>", { desc = "Exit insert mode" })
map("n", "x", '"_x', opts)
map("v", "x", '"_x', opts)
map({ "n", "v" }, "d", '"_d', opts)

map("n", "<leader>+", "<C-a>", { desc = "Increment number" })
map("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("Wq", "wq", {})

----------------------------------------------------------------------
-- Diagnostics Hover Toggle
----------------------------------------------------------------------

map("n", "<leader>uj", function()
  vim.g.diagnostics_hover_enabled = not vim.g.diagnostics_hover_enabled
  local msg = vim.g.diagnostics_hover_enabled and "Enabled" or "Disabled"
  vim.notify("Diagnostics hover: " .. msg, vim.log.levels.INFO, { title = "LSP Hover" })
end, { desc = "Toggle diagnostics hover" })

----------------------------------------------------------------------
-- Django Navigation via Snacks.picker()
----------------------------------------------------------------------

local function sfind(params)
  Snacks.picker("files", params)
end

-- views.py
map("n", "<leader>dv", function()
  sfind({ search = "views.py", cwd = vim.fn.getcwd() })
end, { desc = "Django: Find views.py" })

-- models.py
map("n", "<leader>dm", function()
  sfind({ search = "models.py", cwd = vim.fn.getcwd() })
end, { desc = "Django: Find models.py" })

-- serializers.py
map("n", "<leader>ds", function()
  sfind({ search = "serializers.py", cwd = vim.fn.getcwd() })
end, { desc = "Django: Find serializers.py" })

-- urls.py
map("n", "<leader>du", function()
  sfind({ search = "urls.py", cwd = vim.fn.getcwd() })
end, { desc = "Django: Find urls.py" })

-- templates/
map("n", "<leader>dt", function()
  sfind({ cwd = vim.fn.getcwd() .. "/templates" })
end, { desc = "Django: Search templates/" })


vim.keymap.set("n", "x", '"_x')
vim.keymap.set("i", "<C-v>", "<C-r>+", { noremap = true })
vim.keymap.set("n", "ciw", '"_ciw')
vim.keymap.set("n", "cw", '"_cw')
vim.keymap.set("n", "ciw", '"_ciw')
vim.keymap.set("v", "d", '"_d')
vim.keymap.set("n", "d", '"_d')

