import * as pulumi from "@pulumi/pulumi";
import * as digitalocean from "@pulumi/digitalocean";

// Look up the existing "macbook" SSH key
const sshKey = digitalocean.getSshKey({
  name: "macbook",
});

// Create a DigitalOcean Droplet
const droplet = new digitalocean.Droplet("dotfiles-droplet", {
  image: "debian-13-x64",
  region: "atl1", // Atlanta
  size: "s-1vcpu-1gb-amd", // Smallest available: $7/mo, 1vCPU, 1GB RAM, 25GB disk
  sshKeys: [pulumi.output(sshKey).apply(key => key.id.toString())],
  tags: ["dotfiles", "ansible-managed"],
});

// Export the droplet's IP address
export const dropletIp = droplet.ipv4Address;
export const dropletId = droplet.id;
export const dropletName = droplet.name;
