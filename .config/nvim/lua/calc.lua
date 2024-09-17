function run_python_on_visual_selection()
  local _, start_row, start_col, _ = unpack(vim.fn.getpos("'<"))
  local _, end_row, end_col, _ = unpack(vim.fn.getpos("'>"))

  local lines = vim.fn.getline(start_row, end_row)
  if #lines == 0 then return end
  
  if #lines == 1 then
    lines[1] = string.sub(lines[1], start_col, end_col)
  else
    lines[1] = string.sub(lines[1], start_col, -1)
    lines[#lines] = string.sub(lines[#lines], 1, end_col)
  end

  local selected_text = table.concat(lines, "\n")
  local home = os.getenv("HOME")
  local script_path = home .. "/.config/nvim/solver.py"

  -- Use vim.fn.jobstart to run the Python script asynchronously
  local handle = vim.fn.jobstart(
    {"python3", script_path},
    {
      stdout_buffered = true,
      on_stdout = function(_, data)
        -- Join the output data into a single string
        local result = table.concat(data, "\n")
        
        -- Copy the result to the clipboard
        vim.fn.setreg('', result)  
        -- Print a message indicating that the output was copied
		vim.api.nvim_err_writeln("Result: "..result)
      end,
      on_stderr = function(_, data)
        vim.api.nvim_err_writeln(table.concat(data, "\n"))
      end
    }
  )

  -- Send the selected text to the Python script
  vim.fn.chansend(handle, selected_text)
  vim.fn.chanclose(handle, "stdin")
end

-- Map the function to a keybinding in visual mode
vim.api.nvim_set_keymap('v', ' c', [[:lua run_python_on_visual_selection()<CR>]], { noremap = true, silent = true })

