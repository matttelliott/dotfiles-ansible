"""Test Mosh setup."""

def test_mosh_installed(host):
    """Test mosh client and server are installed."""
    assert host.package("mosh").is_installed

def test_mosh_client_executable(host):
    """Test mosh client is executable."""
    mosh_client = host.file("/usr/bin/mosh")
    assert mosh_client.exists
    assert mosh_client.is_file

def test_mosh_server_executable(host):
    """Test mosh-server is executable."""
    mosh_server = host.file("/usr/bin/mosh-server")
    assert mosh_server.exists
    assert mosh_server.is_file
