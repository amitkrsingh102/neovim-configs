vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

--terminal
keymap.set("n", "<Leader>Lo", function()
  vim.cmd("7split")
  vim.cmd("terminal")
  vim.api.nvim_feedkeys("i", "n", true)
end, { noremap = true, silent = true, desc = "Open terminal in a split" })

keymap.set("n", "<Leader>Lt", function()
  for _, winid in ipairs(vim.api.nvim_list_wins()) do
    local bufnr = vim.api.nvim_win_get_buf(winid)
    if vim.api.nvim_buf_get_option(bufnr, "buftype") == "terminal" then
      vim.api.nvim_set_current_win(winid)
      vim.api.nvim_feedkeys("i", "n", true)
      return
    end
  end
  print("Terminal not found")
end, { noremap = true, silent = true, desc = "Toggle to terminal and enter insert mode" })

keymap.set("t", "<C-0>", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\>", true, false, true), "n", true)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, false, true), "n", true)
  vim.cmd("wincmd p")
end, { noremap = true, silent = true, desc = "Switch to the previous window" })

keymap.set("t", "<C-9>", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\>", true, false, true), "n", true)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-d>", true, false, true), "n", true)
  vim.cmd("close")
end, { noremap = true, silent = true, desc = "Close terminal" })
