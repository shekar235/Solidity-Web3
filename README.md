# Solidity-Web3
This is learning progress repo

# Proposal Contract Deployment on Sepolia Testnet

This repository contains the smart contract for a proposal system deployed on the Sepolia testnet. The contract is created using Remix Ethereum IDE and deployed using MetaMask as the injector.

## Contract Details

- **Contract Address:** `0x06a35c2a6a6accd49d6f3c7cb4925a6000b0d6b2`
- **Network:** Sepolia Testnet

## Deployment Steps

1. **Remix Ethereum IDE:**
   - The smart contract is developed using Remix, an online Ethereum IDE.
   - Visit [Remix](https://remix.ethereum.org/) and open the contract file.

2. **MetaMask Integration:**
   - Ensure that MetaMask is installed and configured in your browser.
   - Use MetaMask as the injector for Remix transactions.

3. **Sepolia Testnet:**
   - Connect MetaMask to the Sepolia testnet.
   - If Sepolia is not listed, you may need to add the network manually. Refer to [Sepolia Testnet](https://sepolia.io/) for network details.

4. **Compile and Deploy:**
   - Compile the smart contract in Remix.
   - Deploy the contract to the Sepolia testnet using the MetaMask account.

5. **Verify Deployment:**
   - Once deployed, verify the contract details on the Sepolia testnet explorer.

## Smart Contract Features

- **Create:** Create a proposal by providing title,description,total_votes_to_end.
- **Set Owner:** To update new Owner.
- **Terminate Proposal:** Terminate specific proposal.
- **Voting System:** Proposals can be voted on with options for approval, rejection, or passing.
- **getCurrentProposal:** fetch current proposal.
- **getProposale:** Fetch specific proposal.
- **isVoted:** To verify is vote is completed from a specific address.


Feel free to contribute or raise issues if you find any improvements or have suggestions.

---



