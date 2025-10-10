"""Test NeoVim setup."""

def test_neovim_installed(host):
    """Test neovim is installed and executable."""
    nvim = host.file("/usr/local/bin/nvim")
    assert nvim.exists
    assert nvim.is_symlink

def test_neovim_version(host):
    """Test neovim version is 0.11 or higher."""
    version_output = host.check_output("nvim --version")
    # Extract version number from first line (e.g., "NVIM v0.11.0")
    version_line = version_output.split('\n')[0]
    version_str = version_line.split()[1].lstrip('v')
    major, minor = map(int, version_str.split('.')[:2])

    assert major == 0 and minor >= 11, f"Expected NeoVim 0.11+, got {version_str}"

def test_neovim_config_exists(host):
    """Test neovim config directory and init.lua exist."""
    nvim_dir = host.file("/home/developer/.config/nvim")
    assert nvim_dir.exists
    assert nvim_dir.is_directory

    init_lua = host.file("/home/developer/.config/nvim/init.lua")
    assert init_lua.exists
