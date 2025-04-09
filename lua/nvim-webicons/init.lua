local M = {}

-- Cargar los datos base
M.data = require("nvim-webicons.data").data

-- Definir la función setup()
function M.setup(user_config)
	if user_config and user_config.data then
		M.data = vim.tbl_deep_extend("force", M.data or {}, user_config.data)
	end
end

-- Función para calcular la posición centrada
local function calculate_center_position(width, height)
	local ui = vim.api.nvim_list_uis()[1]
	local row = math.floor((ui.height - height) / 2)
	local col = math.floor((ui.width - width) / 2)
	return row, col
end

-- Función para mostrar un popup con una lista de elementos
function M.show_popup(items, callback, is_submenu)
	local buf = vim.api.nvim_create_buf(false, true)
	-- local width = get_max_width(items) + 10
	-- local height = #items
	local width = 90
	local height = 30

	local row, col = calculate_center_position(width, height)

	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = "single",
	})

	vim.api.nvim_buf_set_lines(buf, 0, -1, false, items)
	vim.api.nvim_buf_set_option(buf, "modifiable", false)

	-- Mapear <CR> para seleccionar un elemento
	vim.api.nvim_buf_set_keymap(buf, "n", "<CR>", "", {
		callback = function()
			local line = vim.api.nvim_get_current_line()
			vim.api.nvim_win_close(win, true)
			callback(line)
		end,
	})

	-- Mapear <Esc> para cerrar el popup
	vim.api.nvim_buf_set_keymap(buf, "n", "<Esc>", "", {
		callback = function()
			vim.api.nvim_win_close(win, true)
		end,
	})

	-- Mapear <Backspace> para volver al menú principal (solo en submenús)
	if is_submenu then
		vim.api.nvim_buf_set_keymap(buf, "n", "<BS>", "", {
			callback = function()
				vim.api.nvim_win_close(win, true)
				M.start() -- Volver al menú principal
			end,
		})
	end
end

-- Función mejorada para ordenar tablas (maneja nil y tipos mixtos)
local function sort_table(t)
	if not t then
		return {}
	end

	local sorted_keys = {}
	for key in pairs(t) do
		table.insert(sorted_keys, tostring(key)) -- Convertimos todo a string para ordenar
	end
	table.sort(sorted_keys)
	return sorted_keys
end

-- Función para construir líneas del popup de forma consistente
local function build_popup_line(emoji, text)
	return string.format(" %s %s", tostring(emoji or ""), tostring(text or ""))
end
-- Función para construir líneas del popup con padding consistente
local function build_popup_lines(data)
	local lines = {}
	local keys = sort_table(data)

	-- Paso 1: encontrar la longitud máxima del icono (en caracteres visuales)
	local max_icon_width = 0
	for _, key in ipairs(keys) do
		local value = data[key]
		local icon = type(value) == "table" and "" or value
		local width = vim.fn.strdisplaywidth(tostring(icon or ""))
		if width > max_icon_width then
			max_icon_width = width
		end
	end

	-- Paso 2: construir líneas con padding
	for _, key in ipairs(keys) do
		local value = data[key]
		local icon = type(value) == "table" and "" or value
		local icon_str = tostring(icon or "")
		local padding = max_icon_width - vim.fn.strdisplaywidth(icon_str)
		local padded_icon = icon_str .. string.rep(" ", padding)
		table.insert(lines, string.format(" %s  %s", padded_icon, key))
	end

	return lines
end

-- Función genérica para manejar selección de cualquier nivel
function M.handle_selection(current_data)
	local items = build_popup_lines(current_data)

	M.show_popup(items, function(item)
		local clean_key = item:match("^%s*.-%s+(.-)%s*$")

		if type(current_data[clean_key]) == "table" then
			-- Submenú: llamada recursiva
			M.handle_selection(current_data[clean_key])
		else
			-- Acción final
			local icon = item:match("^%s*(.-)%s") or ""
			vim.api.nvim_put({ icon }, "c", true, true)
			vim.api.nvim_feedkeys("a ", "n", false)
		end
	end, true)
end

function M.handle_category_selection(parent_category, category)
	if not M.data[parent_category] or not M.data[parent_category][category] then
		return
	end

	local sub_items = {}
	for _, key in ipairs(sort_table(M.data[parent_category][category])) do
		table.insert(sub_items, build_popup_line(M.data[parent_category][category][key], key))
	end

	M.show_popup(sub_items, function(item)
		local content = item:match("^%s*(.-)%s") or item:match("^%s*(.-)$")
		vim.api.nvim_put({ content }, "c", true, true)
		vim.api.nvim_feedkeys("a ", "n", false)
	end, true)
end

function M.start()
	M.handle_selection(M.data)
end

return M
