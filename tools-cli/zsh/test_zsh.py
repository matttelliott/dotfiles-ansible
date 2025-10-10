"""Test Zsh setup."""

def test_zsh_installed(host):
    """Test zsh is installed."""
    assert host.package("zsh").is_installed

def test_zsh_executable(host):
    """Test zsh is executable."""
    zsh = host.file("/usr/bin/zsh")
    assert zsh.exists
    assert zsh.is_file

def test_developer_default_shell(host):
    """Test developer user has zsh as default shell."""
    user = host.user("developer")
    assert user.shell == "/usr/bin/zsh"

def test_developer2_default_shell(host):
    """Test developer2 user has zsh as default shell."""
    user = host.user("developer2")
    assert user.shell == "/usr/bin/zsh"
