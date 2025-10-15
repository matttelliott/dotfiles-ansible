# Claude Code Setup

Installs and configures Claude Code CLI on target machines.

## What Gets Installed

- **@anthropic-ai/claude-code** via npm (using NVM)
- **API Key** - Encrypted with ansible-vault
- **CLAUDE.md** - Your behavioral protocol rules (encrypted)

## Encrypted Files

The following files are encrypted with ansible-vault:
- `files/api_key.txt` - Contains your Anthropic API key
- `files/CLAUDE.md` - Your Claude behavioral protocol

### Vault Password

The vault password is: `dotfiles`

To edit encrypted files:
```bash
# Edit API key
ansible-vault edit tools-ai/claude-code/files/api_key.txt --vault-password-file <(echo "dotfiles")

# Edit CLAUDE.md
ansible-vault edit tools-ai/claude-code/files/CLAUDE.md --vault-password-file <(echo "dotfiles")
```

## Running Playbook with Vault

When running the playbook, you must provide the vault password:

```bash
# Option 1: Interactive prompt
ansible-playbook -i inventory.ini playbook.yaml --ask-vault-pass

# Option 2: Password file
echo "dotfiles" > .vault_pass
ansible-playbook -i inventory.ini playbook.yaml --vault-password-file .vault_pass

# Option 3: Inline (for automation)
ansible-playbook -i inventory.ini playbook.yaml --vault-password-file <(echo "dotfiles")
```

## Files Created on Target

- `/home/<user>/.config/claude/api_key.txt` - API key (mode 0600)
- `/home/<user>/.claude/CLAUDE.md` - Behavioral protocol
- `~/.nvm/versions/node/*/bin/claude` - CLI binary

## Usage

After installation, users can run:
```bash
claude
```

The API key will be automatically loaded from `~/.config/claude/api_key.txt`.
