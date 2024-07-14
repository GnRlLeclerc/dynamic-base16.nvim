-- File watching logic

-- DEBUG
local function dump(o)
  if type(o) == 'table' then
    local s = '{ '
    for k, v in pairs(o) do
      if type(k) ~= 'number' then
        k = '"' .. k .. '"'
      end
      s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
    end
    return s .. '} '
  else
    return tostring(o)
  end
end

local M = {}

-- Watch a path for changes, call a callback on every change
--- @param path string
--- @param callback function
function M.watch(path, callback)
  local handle = vim.uv.new_fs_event()

  if handle == nil then
    vim.notify('Error starting watch handle.')
    return
  end

  local watch_config = {
    stat = false,
    watch_entry = false,
    recursive = true,
  }

  local uv_callback = function(err, _, events)
    if err then
      vim.notify(string.format('Error: %s', err, 'error'))
      return
    end

    -- Reset the color theme on change
    -- DEBUG
    vim.notify(dump(events))
    if events[1] == 'change' then
      callback()
    end
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
