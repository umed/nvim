return {
  'navarasu/onedark.nvim',
  name = 'onedark',
  priority = 1000,
  config = function()
    local od = require 'onedark'
    od.style = 'darker'
  end,
}
