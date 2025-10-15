# Infrastructure Setup

This directory contains Pulumi code to provision DigitalOcean infrastructure.

## Prerequisites

1. **DigitalOcean API Token**: Get your token from https://cloud.digitalocean.com/account/api/tokens
2. **Pulumi**: Already installed via homebrew
3. **Node.js**: For running TypeScript code

## Setup

```bash
# Install dependencies
npm install

# Set your DigitalOcean token
export DIGITALOCEAN_TOKEN="your-token-here"

# Set Pulumi passphrase (for local state encryption)
export PULUMI_CONFIG_PASSPHRASE="dotfiles"

# Configure the DigitalOcean token in Pulumi
pulumi config set digitalocean:token $DIGITALOCEAN_TOKEN --secret
```

## Usage

```bash
# Preview changes
pulumi preview

# Deploy infrastructure
pulumi up

# View outputs (droplet IP)
pulumi stack output dropletIp

# Destroy infrastructure
pulumi destroy
```

### Teardown Ad-Hoc Droplets

For droplets created outside of Pulumi (ad-hoc droplets), use the teardown script:

```bash
# Set the DigitalOcean token and Pulumi passphrase
export DIGITALOCEAN_TOKEN=$(PULUMI_CONFIG_PASSPHRASE="dotfiles" pulumi config get digitalocean:token)

# Teardown a specific droplet by IP
npm run teardown <ip-address>

# Example
npm run teardown 129.212.176.135
```

The script will:
1. Search for a droplet with the specified IP address
2. Display droplet details (name, ID, region, size, status)
3. Destroy the droplet via DigitalOcean API
4. Confirm successful deletion

## What Gets Created

- **Droplet**: Debian 13 x64
- **Size**: s-1vcpu-512mb-10gb (smallest)
- **Region**: atl1 (Atlanta)
- **SSH Key**: Uses existing "macbook" key
- **Tags**: dotfiles, ansible-managed

## Integration with Ansible

After deploying, update the `inventory.ini` file with the droplet IP:

```bash
pulumi stack output dropletIp
```

Then run Ansible:

```bash
ansible-playbook -i inventory.ini playbook.yaml
```
