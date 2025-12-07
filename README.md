# 🚀 Minhas Configurações do Neovim

Setup pessoal do Neovim usando **AstroNvim** para desenvolvimento **.NET** e **Flutter**.

## ✨ Destaques

- 🤖 **GitHub Copilot** com Claude Haiku 4.5
- 💬 **Copilot Chat** com UI personalizada e formatação automática de blocos de código
- 📱 **Flutter Tools** - Suporte completo para Dart/Flutter
- 🔷 **OmniSharp** - IntelliSense para C#
- 🎨 **Visual Studio Insider Dark** com palette ajustada à mão
- 🔍 **Telescope** - Busca rápida de arquivos

## 📦 Plugins Principais

### Produtividade
- **GitHub Copilot Chat** - IA integrada para programação
- **Telescope** - Busca fuzzy de arquivos e texto
- **Comment.nvim** - Comentar código facilmente
- **ToggleTerm** - Terminal flutuante

### Desenvolvimento .NET
- **OmniSharp Extended** - LSP para C#
- Suporte para .NET Framework e .NET Core

### Desenvolvimento Flutter
- **Flutter Tools** - Hot reload, device management, widget guides
- **Dart LSP** integrado

### Visual
- **Visual Studio Insider Dark** - Palette portada e refinada no `astroui`
- **Copilot Chat UI** - Layout flutuante com cabeçalhos, separadores e syntax highlight garantido
- **GitSigns** - Mostra mudanças Git inline
- **Indent Blankline** - Guias de indentação

## ⚙️ Instalação

### 1. Pré-requisitos

```powershell
# Instalar Neovim (Windows)
winget install Neovim.Neovim

# Instalar Git
winget install Git.Git

# Instalar Node.js (necessário para alguns plugins)
winget install OpenJS.NodeJS
```

### 2. Instalar AstroNvim

```powershell
# Fazer backup da config antiga (se existir)
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak

# Clonar AstroNvim
git clone --depth 1 https://github.com/AstroNvim/template $env:LOCALAPPDATA\nvim
Remove-Item $env:LOCALAPPDATA\nvim\.git -Recurse -Force
```

### 3. Aplicar minhas configurações

```powershell
# Clonar este repositório
cd $env:LOCALAPPDATA\nvim
git init
git remote add origin https://github.com/AlfredoNeeto/astro-alfredo-vim.git
git pull origin main

# Abrir Neovim e instalar plugins
nvim

# Atualizar parsers do Treesitter
:TSUpdate
```

### 4. Instalar LSPs

Dentro do Neovim, execute:

```vim
:LspInstall omnisharp     " Para C#
" Dart LSP é instalado automaticamente pelo Flutter Tools
```

## ⌨️ Atalhos Principais

### Básicos
- `Ctrl+s` - Salvar arquivo
- `Alt+t` - Abrir/fechar terminal flutuante
- `Ctrl+p` - Buscar arquivos (Telescope)
- `Space+f+f` - Buscar arquivos
- `Space+f+w` - Buscar texto no projeto

### Copilot
- `Ctrl+l` - Aceitar sugestão inline
- `Space+c+c` - Toggle chat
- `Space+c+e` - Explicar código
- `Space+c+t` - Gerar testes
- `Space+c+f` - Corrigir código
- `Space+c+o` - Otimizar código

#### Formatação automática no Copilot Chat
- O sistema força blocos cercados com ```linguagem```, garantindo syntax highlight.
- Use nomes nativos do Treesitter (`csharp`, `cpp`, `python`, `javascript`, `html`, etc.).
- Evite formatos como `[csharp] block` – eles são convertidos automaticamente, mas o ideal é já pedir nesse formato.

### SSH
- `<leader>sh` - Abrir seletor interativo de hosts
- `:SSH` - Abrir seletor interativo via comando
- `:SSH alias` - Conectar ao host configurado
- `:SSH usuario@servidor` - Conectar diretamente
- `Esc` - Fechar terminal SSH (dentro do terminal)
- `Alt+t` - Alternar terminal flutuante

### Navegação
- `Space+e` - Toggle explorador de arquivos
- `Space+o` - Toggle outline (símbolos)
- `Ctrl+h/j/k/l` - Navegar entre janelas

## 🔧 Comandos Úteis

### Flutter
```vim
:FlutterRun          " Rodar app
:FlutterDevices      " Listar devices
:FlutterReload       " Hot reload
:FlutterRestart      " Hot restart
:FlutterQuit         " Parar app
```

### Vim Básico
```vim
:w          " Salvar
:q          " Sair
:wq         " Salvar e sair
i           " Modo inserção
Esc         " Modo normal
v           " Modo visual
```

## 🔐 SSH Rápido

### Como usar

1. **Seletor interativo**: Pressione `<leader>sh` ou digite `:SSH` e escolha o host
2. **Conexão direta**: `:SSH dev` ou `:SSH usuario@servidor.com`
3. **Fechar terminal**: Pressione `Esc` dentro do terminal SSH

### Configuração de hosts

Os hosts são lidos automaticamente de `~/.ssh/config` e `~/.ssh/config.d/*`. Exemplo de configuração:

```ssh-config
Host dev
    HostName seu-servidor.com
    User ubuntu
    IdentityFile ~/.ssh/id_rsa
    IdentitiesOnly yes

Host prod
    HostName prod.example.com
    User deploy
    Port 2222
```

**Aliases estáticos** (opcional): Adicione ao `lua/polish.lua`:

```lua
vim.g.neovim_ssh_hosts = {
    prod = "ubuntu@prod.example.com",
    lab = "dev@10.0.0.42 -p 2202",
}
```

### Recursos

- ✅ Terminal flutuante (25x100) com borda arredondada
- ✅ Leitura automática de `~/.ssh/config`
- ✅ Autocomplete de hosts cadastrados
- ✅ Suporte a aliases e conexões diretas
- ✅ Fecha com `Esc` ou `Alt+t`

## 🛠️ Requisitos para .NET

Para desenvolvimento .NET Framework, certifique-se de ter instalado:

- **Visual Studio Build Tools 2022** ou superior
- **MSBuild** no PATH

Build e Run podem ser feitos via terminal:
```powershell
msbuild SeuProjeto.sln
dotnet build
dotnet run
```

## 📁 Estrutura

```
nvim/
├── lua/
│   └── plugins/
│       ├── user.lua           # Minhas configs principais
│       ├── astrocore.lua      # Configs core do AstroNvim
│       ├── astrolsp.lua       # Configurações LSP
│       ├── astroui.lua        # Configurações UI
│       ├── github-theme.lua   # Tema GitHub
│       └── ...
├── .gitignore
└── README.md
```

## 🎨 Tema

Usando **GitHub Dark Default** com suporte a:
- Syntax highlighting para C# e Dart
- Ícones customizados para .cs e .dart
- Integração com GitSigns

## 🤝 Contribuindo

Este é um repositório pessoal, mas sinta-se à vontade para usar como referência!

## 📝 Notas

- Este setup foi criado para **Windows 11** com **PowerShell**
- Terminal configurado usa **PowerShell** por padrão
- GitHub Copilot requer autenticação (`:Copilot setup`)
- Flutter Tools requer Flutter SDK instalado

## 🔗 Links Úteis

- [AstroNvim](https://astronvim.com/)
- [Neovim](https://neovim.io/)
- [GitHub Copilot](https://github.com/features/copilot)

---

**Autor:** Alfredo Neeto  
**Repo:** [astro-alfredo-vim](https://github.com/AlfredoNeeto/astro-alfredo-vim)
