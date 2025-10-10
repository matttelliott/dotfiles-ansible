"""Test Tmux setup."""

def test_tmux_installed(host):
    """Test tmux is installed."""
    assert host.package("tmux").is_installed

def test_tmux_config_exists(host):
    """Test tmux config exists."""
    assert host.file("/home/developer/.tmux.conf").exists
