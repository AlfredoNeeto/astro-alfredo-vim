-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Configurar hosts SSH personalizados (opcional)
vim.g.neovim_ssh_hosts = {
  -- Exemplos:
  -- prod = "usuario@servidor.com",
  -- dev = "usuario@192.168.1.100 -p 2222",
}
