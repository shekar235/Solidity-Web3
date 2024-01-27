// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
contract ProposalContract {
    // Our contract code
    address owner;

    uint256 private counter; // This line is added
    struct Proposal {
        string title; // Title of the proposal
        string description; // Description of the proposal
        uint256 approve; // Number of approve votes
        uint256 reject; // Number of reject votes
        uint256 pass; // Number of pass votes
        uint256 total_vote_to_end; // When the total votes in the proposal reaches this limit, proposal ends
        bool current_state; // This shows the current state of the proposal, meaning whether if passes of fails
        bool is_active; // This shows if others can vote to our contract
    }

    mapping(uint256 => Proposal) proposal_history; // Recordings of previous proposals
    address[]  private voted_addresses; //voted address

    constructor() {
        owner = msg.sender;
        voted_addresses.push(msg.sender);
    }

    modifier onlyOwner() {
        require(msg.sender == owner,"Only owner can modify");
        _;
    }

    modifier active() {
        require(proposal_history[counter].is_active == true, "The proposal is not active");
        _;
    }

    modifier newVoter(address _address) {
    require(!isVoted(_address), "Address has already voted");
    _;
}

    function setOwner(address new_owner) external onlyOwner {
        owner = new_owner;
    }

    function isVoted(address _address) public view returns (bool) {
        for (uint256 i = 0; i < voted_addresses.length; i++) {
            if (voted_addresses[i] == _address) {
                return true;
            }
        }
        return false;
    }


    function create(string calldata _title,string calldata _description, uint256 _total_vote_to_end) external onlyOwner  {
        counter += 1;
        proposal_history[counter] = Proposal(_title,_description, 0, 0, 0, _total_vote_to_end, false, true);
    }

    function vote(uint8 choice) external active newVoter(msg.sender) {
        Proposal storage proposal = proposal_history[counter];
        uint256 total_vote = proposal.approve + proposal.reject + proposal.pass;

        voted_addresses.push(msg.sender);

        if (choice == 1) {
            proposal.approve += 1;
        } else if (choice == 2) {
            proposal.reject += 1;
        } else if (choice == 0) {
            proposal.pass += 1;
        }

        if (total_vote + 1 == proposal.total_vote_to_end) {
            proposal.is_active = false;
            voted_addresses = [owner];
        }

        proposal.current_state = calculateCurrentState(proposal.approve, proposal.reject, proposal.pass);
    }

     function calculateCurrentState(uint256 approve, uint256 reject, uint256 pass) private pure returns (bool) {
        pass = (pass + 1) / 2;

        if (approve > reject + pass) {
            return true;
        } else {
            return false;
        }
    }

    function teminateProposal() external onlyOwner active {
        proposal_history[counter].is_active = false;
    }

    function getCurrentProposal() external view returns(Proposal memory) {
        return proposal_history[counter];
    }

    function getProposal(uint256 number) external view returns(Proposal memory) {
        return proposal_history[number];
    }

}

