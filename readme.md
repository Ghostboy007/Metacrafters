# MyToken Solidity Smart Contract

## Overview

Welcome to the `MyToken` Solidity smart contract! This contract implements a basic ERC-20-like token on the Ethereum blockchain. It includes functionalities for minting new tokens, burning existing tokens, and managing token balances.

This document will guide you through the key aspects of the `MyToken` smart contract, explaining its purpose and providing instructions on how to interact with it.

## Features

- **Token Details**: The contract stores the name, symbol, and total supply of the token.
- **Balance Management**: Users can query the balance of any address.
- **Minting**: Increase the token supply by minting new tokens to a specified address.
- **Burning**: Decrease the token supply by burning tokens from a specified address.
- **Transfer Event**: Emits a transfer event whenever tokens are minted or burned.

## Getting Started

### Prerequisites

To interact with this contract, you will need:

- [Solidity](https://docs.soliditylang.org/) version 0.8.18 or compatible.
- A development environment like [Remix](https://remix.ethereum.org/) or [Truffle](https://www.trufflesuite.com/truffle).
- An Ethereum client or test network for deployment (e.g., [Ganache](https://www.trufflesuite.com/ganache)).

### Deployment

To deploy the `MyToken` contract:

1. Open your development environment (e.g., Remix).
2. Copy the `MyToken` contract code into a new file named `MyToken.sol`.
3. Compile the contract using the Solidity compiler version 0.8.18.
4. Deploy the contract, specifying the initial token name, symbol, and supply in the constructor.

Example constructor parameters:
- `name`: `"MyToken"`
- `symbol`: `"MTK"`
- `initialSupply`: `1000000` (representing 1,000,000 tokens)


