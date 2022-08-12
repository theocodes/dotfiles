local pack = "packer"

local function bootstrap (url)
	local name = url:gsub(".*/", "")
	local path = vim.fn.stdpath [[data]] .. "/site/pack/".. pack .. "/start/" .. name

	if vim.fn.isdirectory(path) == 0 then
		print(name .. ": installing in data dir...")

		vim.fn.system {"git", "clone", "--depth", "1", url, path}

		vim.cmd [[redraw]]
		print(name .. ": finished installing")
	end
end

bootstrap "https://github.com/wbthomason/packer.nvim"
bootstrap "https://github.com/Olical/aniseed"

-- let aniseed load the fennel configuration
vim.cmd [[ let g:aniseed#env = v:true ]]
