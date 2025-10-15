#!/usr/bin/env ts-node
/**
 * Teardown script for ad-hoc DigitalOcean droplets
 *
 * Usage:
 *   DIGITALOCEAN_TOKEN=<token> npm run teardown <ip-address>
 *
 * Example:
 *   DIGITALOCEAN_TOKEN=dop_v1_... npm run teardown 129.212.176.135
 */

async function teardownDroplet(targetIp: string) {
  // Get the DigitalOcean token from environment variable
  const token = process.env.DIGITALOCEAN_TOKEN;

  if (!token) {
    throw new Error("DIGITALOCEAN_TOKEN environment variable is required");
  }

  console.log(`🔍 Looking for droplet with IP: ${targetIp}`);

  // Use DigitalOcean API to find droplet by IP
  const response = await fetch("https://api.digitalocean.com/v2/droplets", {
    headers: {
      "Authorization": `Bearer ${token}`,
      "Content-Type": "application/json"
    }
  });

  if (!response.ok) {
    throw new Error(`Failed to fetch droplets: ${response.statusText}`);
  }

  const data = await response.json();
  const droplets = data.droplets;

  // Find droplet with matching IP
  const droplet = droplets.find((d: any) => {
    const publicIps = d.networks?.v4?.filter((n: any) => n.type === "public") || [];
    return publicIps.some((n: any) => n.ip_address === targetIp);
  });

  if (!droplet) {
    console.log(`❌ No droplet found with IP: ${targetIp}`);
    console.log(`\nAvailable droplets:`);
    droplets.forEach((d: any) => {
      const publicIps = d.networks?.v4?.filter((n: any) => n.type === "public") || [];
      const ips = publicIps.map((n: any) => n.ip_address).join(", ");
      console.log(`  - ${d.name} (${d.id}): ${ips}`);
    });
    return;
  }

  console.log(`✅ Found droplet: ${droplet.name} (ID: ${droplet.id})`);
  console.log(`   Region: ${droplet.region.name}`);
  console.log(`   Size: ${droplet.size.slug}`);
  console.log(`   Status: ${droplet.status}`);

  // Ask for confirmation
  console.log(`\n⚠️  About to destroy droplet ${droplet.name} (${droplet.id})`);
  console.log(`   This action cannot be undone!`);

  // Destroy the droplet
  console.log(`\n🗑️  Destroying droplet...`);
  const deleteResponse = await fetch(`https://api.digitalocean.com/v2/droplets/${droplet.id}`, {
    method: "DELETE",
    headers: {
      "Authorization": `Bearer ${token}`,
      "Content-Type": "application/json"
    }
  });

  if (!deleteResponse.ok) {
    throw new Error(`Failed to destroy droplet: ${deleteResponse.statusText}`);
  }

  console.log(`✅ Droplet ${droplet.name} (${droplet.id}) destroyed successfully!`);
  console.log(`   IP ${targetIp} is now available.`);
}

// Main execution
const targetIp = process.argv[2];

if (!targetIp) {
  console.error("❌ Error: IP address is required");
  console.log("\nUsage:");
  console.log("  npm run teardown <ip-address>");
  console.log("\nExample:");
  console.log("  npm run teardown 129.212.176.135");
  process.exit(1);
}

// Validate IP format
const ipRegex = /^(\d{1,3}\.){3}\d{1,3}$/;
if (!ipRegex.test(targetIp)) {
  console.error(`❌ Error: Invalid IP address format: ${targetIp}`);
  process.exit(1);
}

// Run the teardown
(async () => {
  try {
    await teardownDroplet(targetIp);
  } catch (error) {
    console.error(`❌ Error: ${error instanceof Error ? error.message : error}`);
    process.exit(1);
  }
})();
