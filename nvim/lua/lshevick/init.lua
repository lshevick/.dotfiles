require("lshevick.set")
require("lshevick.remap")

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 20

local function escape_pattern(text)
  return text:gsub("([^%w])", "%%%1")
end

function SaveStage()
  local local_file = vim.fn.expand("%:p")
  local local_dir = vim.fn.getcwd()
  local remote = "lshevick@192.168.109.21"
  local admin_remote_base_dir = "/var/www/stage/IncentRev-Admin"
  local web_remote_base_dir = "/var/www/stage/IncentRev-Web"
  local remote_file = ''
  local_dir = escape_pattern(local_dir)

  if string.find(local_dir, "Admin") then
     remote_file = string.gsub(local_file, local_dir, admin_remote_base_dir)
else
     remote_file = string.gsub(local_file, local_dir, web_remote_base_dir)
    end

  -- Construct the SCP command
  local scp_command = string.format("scp %s %s:%s", vim.fn.shellescape(local_file), remote, remote_file)

  -- Execute the SCP command
  os.execute(scp_command)
  print('File Uploaded')
end

function SaveLocal()
  local local_file = vim.fn.expand("%:p")
  local local_dir = vim.fn.getcwd()
  local remote = "lshevick@192.168.1.14"
  local admin_remote_base_dir = "/var/www/IncentRev-Admin-01"
  local web_remote_base_dir = "/var/www/IncentRev-Web-01"
  local remote_file = ''
  local_dir = escape_pattern(local_dir)

  if string.find(local_dir, "Admin") then
     remote_file = string.gsub(local_file, local_dir, admin_remote_base_dir)
else
     remote_file = string.gsub(local_file, local_dir, web_remote_base_dir)
    end

  -- Construct the SCP command
  local scp_command = string.format("scp %s %s:%s", vim.fn.shellescape(local_file), remote, remote_file)

  -- Execute the SCP command
  os.execute(scp_command)
  print('File Uploaded')
end

vim.keymap.set("n", "<leader>g", "<cmd>silent :w | lua SaveStage()<CR>")
vim.keymap.set("n", "<leader>l", "<cmd>silent :w | lua SaveLocal()<CR>")
