"""Test NeoVim setup."""

def test_neovim_installed(host):
    """Test neovim is installed."""
    assert host.package("neovim").is_installed

def test_neovim_config_exists(host):
    """Test neovim config directory and init.lua exist."""
    nvim_dir = host.file("/home/developer/.config/nvim")
    assert nvim_dir.exists
    assert nvim_dir.is_directory

    init_lua = host.file("/home/developer/.config/nvim/init.lua")
    assert init_lua.exists
