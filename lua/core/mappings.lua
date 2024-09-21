local keymap = vim.keymap

-- NOTE: Mappings
-- Normal mode
keymap.set("n", "<leader>e", vim.cmd.NvimTreeFocus, { desc = "Tree focus" })
keymap.set("n", "<C-n>", vim.cmd.NvimTreeToggle, { desc = "Tree toggle" })
keymap.set("n", "<Tab>", vim.cmd.bnext, { desc = "Next buffer" })
keymap.set("n", "<S-Tab>", vim.cmd.bprevious, { desc = "Previous buffer" })
keymap.set("n", "<leader>b", vim.cmd.DapToggleBreakpoint, { desc = "Toggle breakpoint" })
keymap.set("n", "<leader>ds", vim.cmd.DapSidebar, { desc = "DAP sidebar" })
keymap.set("n", "<leader>dp", function()
	require("dap-python").test_method()
end, { desc = "DAP python" })
keymap.set("n", "<leader>o", "o<Esc>k", { desc = "Create line below, cursor stays in current line" })
keymap.set("n", "<leader>x", vim.cmd.bdelete, { desc = "Delete buffer" })
keymap.set("n", "<leader>X", ":bdelete! <CR>", { desc = "Delete buffer" })
keymap.set("n", "<C-s>", "<Cmd>w<cr>", { desc = "Save" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Navigate half-up page with centered cursor" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Navigate half-down page with centered cursor" })
keymap.set("n", "n", "nzzzv", { desc = "Navigate downwards through selected words with centered cursor" })
keymap.set("n", "N", "Nzzzv", { desc = "Navigate upwards through selected words with centered cursor" })
keymap.set("n", "J", "mzJ`z", { desc = "Concatenate line of codes below where the cursor is" })
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Change word" })
keymap.set("n", "<A-Up>", "<C-w>+", { desc = "Stretch up pane" })
keymap.set("n", "<A-Down>", "<C-w>-", { desc = "Stretch down pane" })
keymap.set("n", "<A-Left>", "<C-w>>", { desc = "Stretch left pane" })
keymap.set("n", "<A-Right>", "<C-w><", { desc = "Stretch right pane" })
keymap.set("n", "<A-b>", "<C-v>", { desc = "Cursor vertical select" })
keymap.set("n", "<Esc>", ":noh <CR>", { desc = "Don't cancel me pls" })
keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>", { desc = "Cursor left pane" })
keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>", { desc = "Cursor right pane" })
keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>", { desc = "Cursor down pane" })
keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>", { desc = "Cursor up pane" })
--keymap.set("n", "<C-h>", "<C-w>h", { desc = "Cursor left pane" })
--keymap.set("n", "<C-l>", "<C-w>l", { desc = "Cursor right pane" })
--keymap.set("n", "<C-j>", "<C-w>j", { desc = "Cursor down pane" })
--keymap.set("n", "<C-k>", "<C-w>k", { desc = "Cursor up pane" })
keymap.set("n", "<leader>fs", ":w !sudo tee %<CR>", { desc = "Save on read only files" })

-- Visual mode
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line upwards" })
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line downwards" })

-- Insert mode
keymap.set("i", "<C-c>", "<Esc>", { desc = "Don't cancel me x2" })

-- Cut mode
keymap.set("x", "<leader>p", '"_dP', { desc = "Paste element without copying changed element" })
