"""Test Claude Code setup."""

def test_claude_installed(host):
    """Test claude is installed and accessible."""
    # Check via NVM path
    cmd = host.run("bash -c 'source ~/.nvm/nvm.sh && which claude'")
    assert cmd.rc == 0

def test_claude_version(host):
    """Test claude reports a version."""
    cmd = host.run("bash -c 'source ~/.nvm/nvm.sh && claude --version'")
    assert cmd.rc == 0
    assert "Claude Code" in cmd.stdout

def test_developer_api_key_exists(host):
    """Test developer user has API key file."""
    api_key = host.file("/home/developer/.config/claude/api_key.txt")
    assert api_key.exists
    assert api_key.is_file
    assert api_key.user == "developer"
    assert api_key.mode == 0o600

def test_developer2_api_key_exists(host):
    """Test developer2 user has API key file."""
    api_key = host.file("/home/developer2/.config/claude/api_key.txt")
    assert api_key.exists
    assert api_key.is_file
    assert api_key.user == "developer2"
    assert api_key.mode == 0o600

def test_developer_claude_md_exists(host):
    """Test developer user has CLAUDE.md."""
    claude_md = host.file("/home/developer/.claude/CLAUDE.md")
    assert claude_md.exists
    assert claude_md.is_file
    assert claude_md.user == "developer"

def test_developer2_claude_md_exists(host):
    """Test developer2 user has CLAUDE.md."""
    claude_md = host.file("/home/developer2/.claude/CLAUDE.md")
    assert claude_md.exists
    assert claude_md.is_file
    assert claude_md.user == "developer2"
