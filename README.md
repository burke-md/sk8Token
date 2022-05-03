# sk8Token

This is a small ERC20 project to explore Access Control.

***

The project will use:

- Truffle
- Ethers
- Open Zeppelin
- Gnosis multi sig safe

In particular the [Access Control](https://docs.openzeppelin.com/contracts/4.x/access-control#ownership-and-ownable) lib from open zeppelin.

A quick [overview](https://www.youtube.com/watch?v=XL0crUpH6Zg) video of the Gnosis multi sig wallet UI is available here.
 
### OPTION 1 Creating Gnosis safe programmatically

***

- Clone associated contracts ``` git clone https://github.com/gnosis/safe-contracts/``` for local chain deployment.

Take special note of three of these contracts : MultiSend, GnosisSafe, GnosisSafeProxyFactory

```
- MultiSend: A helper contract for batching transactions

- GnosisSafeProxyFactory: A helper contract used to generate every person or organization's GnosisSafeProxy contract(the contract we will dirrectly interact with).

- GnosisSafe: The core contract that people and organizations will use a proxy to interact with. 
```

- Install dotenv. Wallet and contract address will be held here. If deployed locally, contract address will be configured based on particular deployment. Other wise address will be based on pre-deployed contracts ```npm i dotenv```

- Install ethers.js to interact with ethereum within a node project ```npm i ethers```

- Add the Gnosis Safe SDK ``` npm i @gnosis.pm/safe-core-sdk @gnosis.pm/safe-ethers-lib```

See index.js for setup and notes.

### OPTION 2 Creating Gnosis safe with user interface

***

Visit [Gnosis web app](https://gnosis-safe.io/) for stream lined creation of multi sig wallet. 
Simply follow the instructions. List wallet address to have contol and select number of confirmations required for each transaction.

![Screen Shot 2022-05-03 at 4 58 20 PM](https://user-images.githubusercontent.com/22263098/166588188-8987ee2c-d105-4879-8aec-230486957930.png)

By configuring the multi sig wallet before deploying the contract, we are able to list the Safe as the default admin role. Without building any sort of frontend the Sk8Token contract can be interacted with inside the Gnosis Safe user interface. 

![Screen Shot 2022-05-03 at 6 53 42 PM](https://user-images.githubusercontent.com/22263098/166588516-764f43e5-9809-41ec-b483-5bb6f52c0973.png)

After submitting the function call each wallet is prompted to sign the transaction, the last one paying the fees. Once the threshold of required signers has been met the transaction will exectue.

![Screen Shot 2022-05-03 at 7 01 28 PM](https://user-images.githubusercontent.com/22263098/166588871-8ef84519-231f-4209-a847-649f6d9bb169.png)


