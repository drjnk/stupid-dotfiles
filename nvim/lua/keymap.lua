vim.keymap.set('n', '<Tab>', '<Cmd>tabn<CR>')
vim.keymap.set('n', '<S-Tab>', '<Cmd>tabp<CR>')
vim.keymap.set('n', '<leader>q', '<Cmd>q<CR>')

vim.keymap.set('n', '<Esc>', '<Cmd>nohl<CR>')

vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.keymap.set('n', '<F2>', '<Cmd>NvimTreeOpen<CR>')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.keymap.set('n', '<leader>r', '<Cmd>FlutterReload<CR>', { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>R', '<Cmd>FlutterRestart<CR>', { desc = 'Telescope help tags' })

vim.keymap.set('n', '[g', function() 
	vim.diagnostic.jump({count= -1,float = true}) 
end)
vim.keymap.set('n', ']g', function() 
	vim.diagnostic.jump({count= 1,float = true}) 
end)

-- Показать текст ошибки в плавающем окне (если virtual_text выключен)
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)

-- Показать список всех ошибок в проекте (Quickfix list)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

local function execute_current_file()
    local filetype = vim.bo.filetype
    local filename = vim.fn.expand('%')
    local output = vim.fn.expand('%:r') -- Имя файла без расширения (для C++)

    if filetype == 'python' then
        vim.cmd('!python3 ' .. filename)
    elseif filetype == 'cpp' then
        -- Компилируем и сразу запускаем
        vim.cmd('!g++ -O3 ' .. filename .. ' -o ' .. output .. ' && ./' .. output)
    elseif filetype == 'c' then
        vim.cmd('!gcc ' .. filename .. ' -o ' .. output .. ' && ./' .. output)
    elseif filetype == 'lua' then
        vim.cmd('luafile %')
        print("Lua script executed.")
    elseif filetype == 'sh' then
        vim.cmd('!bash ' .. filename)
    elseif filetype == 'rust' then
        vim.cmd('!cargo run')
	elseif filetype == 'dart' then
		vim.cmd('FlutterRun')
    else
        print("Тип файла '" .. filetype .. "' не поддерживается для быстрого запуска")
    end
end

vim.keymap.set('n', '<F5>', execute_current_file, { desc = 'Run current file' })
