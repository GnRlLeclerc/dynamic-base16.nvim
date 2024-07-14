-- File watching logic

local M = {}

-- Watch a path for changes, call a callback on every change
--- @param path string
--- @param callback function
function M.watch(path, callback)
  local handle = vim.uv.new_fs_event()

  if handle == nil then
    vim.notify('Error starting watch handle.', vim.log.levels.ERROR)
    return
  end

  local watch_config = {
    stat = false,
    watch_entry = false,
    recursive = true,
  }

  local uv_callback = function(err, _, _)
    if err then
      vim.notify(string.format('Error: %s', err), vim.log.levels.ERROR)
      return
    end

    -- Apply the callback on any event (change, rename, create...)
    callback()
  end

  vim.uv.fs_event_start(handle, path, watch_config, uv_callback)

  -- Stop when exiting neovim
  vim.api.nvim_create_autocmd('VimLeave', {
    callback = function()
      vim.uv.close(handle)
    end,
  })
end

return M
