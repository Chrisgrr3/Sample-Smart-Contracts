pragma solidity ^0.5.0;

contract Ballot {

    struct Voter {
        uint weight;
        bool voted;
        uint8 vote;
    }

    struct Proposal {
        uint voteCount; // We could also add other data about the proposal
    }

    address chairperson; // This state variable will keep track of who created the contract.
    mapping(address => Voter) voters; // Here we map addresses to individual voters
    Proposal[] proposals; // This is an array of proposals


    constructor(uint8 _numProposals) public {
        // Here, we construct a new ballot, where the chairperson is the contract creator, their vote weight is 2, and the length of the
        // proposals array is determined by the number of proposals being added to the ballot contract.
        chairperson = msg.sender;
        voters[chairperson].weight = 2;
        proposals.length = _numProposals;
    }

    function register(address toVoter) public {
        // This is meant for registering a voter. The 'if' statement checks if the caller created the contract or if the user that is being
        // registered has already voted. On registration, the user's vote weight is set to 1 and the 'voted' boolean is set to false.
        if (msg.sender != chairperson || voters[toVoter].voted) return;
        voters[toVoter].weight = 1;
        voters[toVoter].voted = false;
    }

    function vote(uint8 toProposal) public {
        // In the 'vote' function, we reach into storage to locate the voter based on the address being used to call the contract. If the 
        // user has already voted or trying to vote for a proposal with a higher index than the current list of proposals, the function will
        // return without making any changes.

        Voter storage sender = voters[msg.sender];
        if (sender.voted || toProposal >= proposals.length) return;
        // If the 'if' statement fails, the contract callers voter profile is updated to reflect that they voted, notes which proposal they
        // voted for, and increases the vote count for that particular proposal by the voter's vote weight.
        sender.voted = true;
        sender.vote = toProposal;
        proposals[toProposal].voteCount += sender.weight;
    }

    function winningProposal() view public returns (uint8 _winningProposal) {
        uint256 winningVoteCount = 0;
        for (uint8 prop = 0; prop < proposals.length; prop++)
            if (proposals[prop].voteCount > winningVoteCount) {
                winningVoteCount = proposals[prop].voteCount;
                _winningProposal = prop;
            }
    }
}