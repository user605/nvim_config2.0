local lsp_installer = require("nvim-lsp-installer")

lsp_installer.settings({
  ui = {
      icons = {
          server_installed = "✓",
          server_pending = "➜",
          server_uninstalled = "✗",
      },
      keymaps = {
          -- Keymap to expand a server in the UI
          toggle_server_expand = "<CR>",
          -- Keymap to install a server
          install_server = "i",
          -- Keymap to reinstall/update a server
          update_server = "u",
          -- Keymap to update all installed servers
          update_all_servers = "U",
          -- Keymap to uninstall a server
          uninstall_server = "X",
      },
  },

  -- The directory in which to install all servers.
  -- install_root_dir = path.concat { vim.fn.stdpath "data", "lsp_servers" }, -- TODO error on uncommenting???

  pip = {
      -- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior
      -- and is not recommended.
      --
      -- Example: { "--proxy", "https://proxyserver" }
      install_args = {},
  },

  -- Controls to which degree logs are written to the log file. It's useful to set this to vim.log.levels.DEBUG when
  -- debugging issues with server installations.
  log_level = vim.log.levels.INFO,

  -- Limit for the maximum amount of servers to be installed at the same time. Once this limit is reached, any further
  -- servers that are requested to be installed will be put in a queue.
  max_concurrent_installers = 4,
})

lsp_installer.on_server_ready(function(server)
	local opts = { -- TODO
		on_attach = require("lsp.handlers").on_attach,
		capabilities = require("lsp.handlers").capabilities,
	}

	 -- if server.name == "jsonls" then
	 -- 	local jsonls_opts = require("lsp.settings.jsonls")
	 -- 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	 -- end
	 --
	 if server.name == "sumneko_lua" then
	 	local sumneko_opts = require("lsp.settings.sumneko_lua")
	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	 end

	server:setup(opts)
end)
