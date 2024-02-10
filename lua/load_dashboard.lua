local status, db = pcall(require, "dashboard")
if status then
local my_header = [[



███████╗ ██████╗ ██╗   ██╗██╗  ██╗██╗███████╗██████╗ 
██╔════╝██╔═══██╗██║   ██║██║ ██╔╝██║██╔════╝██╔══██╗
███████╗██║   ██║██║   ██║█████╔╝ ██║█████╗  ██║  ██║
╚════██║██║   ██║██║   ██║██╔═██╗ ██║██╔══╝  ██║  ██║
███████║╚██████╔╝╚██████╔╝██║  ██╗██║███████╗██████╔╝
╚══════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝╚══════╝╚═════╝ 
]]
db.setup({
  theme = 'doom',
  config = {
    header = vim.split(my_header,"\n"), --your header
    center = {
      {
        icon = ' ',
        desc = 'Find File           ',
        key = 'b',
        keymap = 'SPC f f',
        key_hl = 'Number',
        key_format = ' %s', -- remove default surrounding `[]`
        action = 'lua print(2)'
      },
      {
        icon = ' ',
        desc = 'Find Dotfiles',
        key = 'f',
        keymap = 'SPC f d',
        key_format = ' %s', -- remove default surrounding `[]`
        action = 'lua print(3)'
      },
    },
    footer = {}  --your footer
  }
})
end
