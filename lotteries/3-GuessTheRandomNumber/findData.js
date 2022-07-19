const { ethers } = require("ethers");

async function main() {
  const provider = new ethers.providers.EtherscanProvider("ropsten");
  const blockNumber = parseInt(process.env.BLOCK);
  const block = await provider.getBlock(blockNumber);
  console.log(block.timestamp);
  console.log(block.parentHash);
}

main();
