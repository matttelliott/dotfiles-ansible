"""Test user setup."""

def test_users_exist(host):
    """Test that developer users exist."""
    assert host.user("developer").exists
    assert host.user("developer2").exists

def test_users_in_wheel_group(host):
    """Test that users are in wheel group."""
    assert "wheel" in host.user("developer").groups
    assert "wheel" in host.user("developer2").groups

def test_wheel_group_sudo(host):
    """Test wheel group has sudo privileges."""
    sudoers = host.file("/etc/sudoers").content_string
    assert "%wheel ALL=(ALL) NOPASSWD: ALL" in sudoers
