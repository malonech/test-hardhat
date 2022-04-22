# Hardhat Issue Context

THESE FILES DO NOT RECREATE THE ERROR AND I AM NO LONGER EXPERIENCING THE ERROR ON MY END. CURRENTLY UNSURE OF THE SOURCE.

When running:

```bash
npx hardhat --verbose node
```

I am getting the following error:

```bash
The Hardhat Network tracing engine could not be initialized. Run Hardhat with --verbose to learn more.
  hardhat:core:hardhat-network:node Hardhat Network tracing disabled: ContractsIdentifier failed to be initialized. Please report this to help us improve Hardhat.
  hardhat:core:hardhat-network:node  TypeError: Cannot read property 'content' of undefined
    at createSourcesModelFromAst (C:\Users\chris\Web3\Polling\node_modules\hardhat\src\internal\hardhat-network\stack-traces\compiler-to-model.ts:67:41)
    at createModelsAndDecodeBytecodes (C:\Users\chris\Web3\Polling\node_modules\hardhat\src\internal\hardhat-network\stack-traces\compiler-to-model.ts:37:3)
    at new HardhatNode (C:\Users\chris\Web3\Polling\node_modules\hardhat\src\internal\hardhat-network\provider\node.ts:377:57)
    at Function.create (C:\Users\chris\Web3\Polling\node_modules\hardhat\src\internal\hardhat-network\provider\node.ts:252:18)
    at HardhatNetworkProvider._init (C:\Users\chris\Web3\Polling\node_modules\hardhat\src\internal\hardhat-network\provider\provider.ts:251:28)
    at HardhatNetworkProvider._send (C:\Users\chris\Web3\Polling\node_modules\hardhat\src\internal\hardhat-network\provider\provider.ts:192:5)
    at HardhatNetworkProvider.request (C:\Users\chris\Web3\Polling\node_modules\hardhat\src\internal\hardhat-network\provider\provider.ts:118:18)
    at SimpleTaskDefinition.action (C:\Users\chris\Web3\Polling\node_modules\hardhat\src\builtin-tasks\node.ts:162:7)
    at Environment._runTaskDefinition (C:\Users\chris\Web3\Polling\node_modules\hardhat\src\internal\core\runtime-environment.ts:219:14)
    at Environment.run (C:\Users\chris\Web3\Polling\node_modules\hardhat\src\internal\core\runtime-environment.ts:131:14) +0ms
```
