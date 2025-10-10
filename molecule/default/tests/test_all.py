"""Import all tests from distributed test files."""
import sys
import importlib.util
from pathlib import Path

# Add project root to path
project_root = Path(__file__).parent.parent.parent.parent

def load_test_module(module_path):
    """Load a test module from a file path."""
    spec = importlib.util.spec_from_file_location("test_module", module_path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    # Add all test functions to global scope
    for name in dir(module):
        if name.startswith('test_'):
            globals()[name] = getattr(module, name)

# Load all test modules
load_test_module(project_root / "platforms/debian/test_users.py")
load_test_module(project_root / "tools-lang/node/test_node.py")
load_test_module(project_root / "tools-cli/git/test_git.py")
load_test_module(project_root / "tools-cli/tmux/test_tmux.py")
load_test_module(project_root / "tools-cli/neovim/test_neovim.py")
load_test_module(project_root / "tools-cli/mosh/test_mosh.py")
