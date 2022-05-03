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
 
### Working with Gnosis safe

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

