-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Configurar hosts SSH personalizados (opcional)
vim.g.neovim_ssh_hosts = {
  -- Tente primeiro sem especificar chave (SSH busca automaticamente em ~/.ssh/)
  dev = "dev",

}
