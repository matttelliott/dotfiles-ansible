"""Test Starship setup."""

def test_starship_installed(host):
    """Test starship is installed."""
    starship = host.file("/usr/local/bin/starship")
    assert starship.exists
    assert starship.is_file

def test_starship_executable(host):
    """Test starship is executable."""
    cmd = host.run("/usr/local/bin/starship --version")
    assert cmd.rc == 0

def test_developer_starship_config(host):
    """Test developer user has starship config."""
    config = host.file("/home/developer/.config/starship.toml")
    assert config.exists
    assert config.is_file
    assert config.user == "developer"

def test_developer2_starship_config(host):
    """Test developer2 user has starship config."""
    config = host.file("/home/developer2/.config/starship.toml")
    assert config.exists
    assert config.is_file
    assert config.user == "developer2"

def test_developer_zshrc_has_starship(host):
    """Test developer .zshrc initializes starship."""
    zshrc = host.file("/home/developer/.zshrc")
    assert zshrc.exists
    assert zshrc.contains("starship init zsh")

def test_developer2_zshrc_has_starship(host):
    """Test developer2 .zshrc initializes starship."""
    zshrc = host.file("/home/developer2/.zshrc")
    assert zshrc.exists
    assert zshrc.contains("starship init zsh")
