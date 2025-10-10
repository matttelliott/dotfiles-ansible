"""Test Node.js setup."""

def test_nodejs_installed(host):
    """Test nodejs and npm are installed."""
    assert host.package("nodejs").is_installed
    assert host.package("npm").is_installed

def test_nvm_installed(host):
    """Test NVM is installed for developer user."""
    nvm_dir = host.file("/home/developer/.nvm")
    assert nvm_dir.exists
    assert nvm_dir.is_directory
