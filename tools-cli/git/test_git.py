"""Test Git setup."""

def test_git_installed(host):
    """Test git is installed."""
    assert host.package("git").is_installed

def test_gitconfig_exists(host):
    """Test gitconfig file exists with correct content."""
    gitconfig = host.file("/home/developer/.gitconfig")
    assert gitconfig.exists
    assert gitconfig.contains("git@matttelliott.com")
    assert gitconfig.contains("Matt T Elliott")
