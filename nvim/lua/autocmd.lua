vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }

    -- Перейти к определению (Go to Definition)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

    -- Показать документацию (Hover) - часто заменяет текст ошибки
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

    -- Быстрые исправления (Code Actions) - САМОЕ ВАЖНОЕ
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)

    -- Переименование переменной по всему проекту
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    
    -- Показать ссылки на символ (References)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  end,
})
