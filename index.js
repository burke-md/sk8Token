require('dotenv').config();

const { SafeFactory, 
        SafeAccountConfig, 
        ContractNetworksConfig 
      } = require('@gnosis.pm/safe-core-sdk');
const Safe = require('@gnosis.pm/safe-core-sdk')["default"];
const { ethers } = require('ethers');
const EthersAdapter = require('@gnosis.pm/safe-ethers-lib')["default"];

const ceoAddress = process.env.ACCOUNT_1;
const ctoAddress = process.env.ACCOUNT_2;
const advisorAddress = process.env.ACCOUNT_3;

const ceo_signer = provider.getSigner(ceoAddress);
const cto_signer = provider.getSigner(ctoAddress);
const advisor_signer = provider.getSigner(advisorAddress);

const ethAdapter_ceo = new EtrhersAdapter({
  ethers, 
  signer: ceo_signer
});
const ethAdapter_cto = new EtrhersAdapter({
  ethers, 
  signer: cto_signer
});
const ethAdapter_advisor = new EtrhersAdapter({
  ethers, 
  signer: advisor_signer
});

const provider = new ethers.providers.JsonRpcProvider();

async function main() {
  const id = await ethAdapter_ceo.getChainId();
  const contractNetworks = {
    [id]: {
      multiSendAddress: process.env.MULTI_SEND_ADDRESS,
      safeMasterCopyAddress: process.env.SAFE_MASTER_COPY_ADDRESS,
      safeProxyFactoryAddress: process.env.SAFE_PROXY_FACTORY_ADDRESS
    }
  }

  //Connect to safe proxy factory w/ above config
  const safeFactory = await SafeFactory.create({
    ethAdapter: ethAdapter_ceo, 
    contractNetworks: contractNetworks
  })

  const safeAccountConfig = {
    owners: [ceoAddress, ctoAddress, advisorAddress],
    threshold: 2 
  };

  //Create multiSig safe proxy
  const safeSdk_ceo = await safeFactory.deploySafe({safeAccountConfig});

  const treasury = safeSdk_ceo.getAddress();
}


main()
  .then(() => process.exit(0))
  .catch((err) => {
    console.error(err);
    process.exit(1);
  });
