//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.0;

// import console for console.logs functionality
import "../node_modules/hardhat/console.sol";

contract Poll {
    // Initialize Global Variables

    // Mapping user to their voting state
    mapping(address => bool) public voted;

    // Mapping user to who they voted for
    mapping(address => address) public votedFor;

    // Mapping candidate to their vote count
    mapping(address => uint) public votes;

    // Mapping candidate address to their name
    mapping(address => string) public candidateNames;

    // Mapping candidate address to bool (valid candidate or not)
    // This is primarily for the "require" in the voting function
    // The same could be accomplished with a loop through the candidates array
    // Not yet sure if I need this, but the looping seems unnescesary, especially with dynamic array
    // because gas prices could get out of control.
    mapping(address => bool) public candidateCheck; 

    // Initialize array to store candidate adresses
    address[] public candidates;

    // An address type variable is used to store ethereum accounts.
    address public owner;

    constructor() {
        owner = msg.sender;
        // Should we initialize with candidates here ?
        addCandidate(0xFE7B2887B60bF530c76675c7C1055Ab7bcA6D0A1, "Huey");
        addCandidate(0x94B6f3978B0A32f7Fa0B15243E86af1aEc23Deb5, "Duey");
        addCandidate(0xD8386e7d5E989EFc9B4409031CF2cc138d140BC0, "Luey");
    }

    modifier uniqueVoter {
        // Check if the voter has already
        require(voted[msg.sender] == false);
        _;
    }

    modifier onlyOwner {
        // Ensure only the owner can use the function
        require(msg.sender == owner);
        _;
    }

    function addCandidate(address _newCandidate, string memory _newCandidateName) public onlyOwner {
        // Update mapping to store candidates name
        candidateNames[_newCandidate] = _newCandidateName;
        // Add candidate to valid candidates list (via true)
        candidateCheck[_newCandidate] = true;
        // Add candidate to list of candidates.
        candidates.push(_newCandidate);
    }

    function vote(address _candidate) external uniqueVoter {
        // Ensure the _candidate is a valid candidate
        require(candidateCheck[_candidate]);
        voted[msg.sender] = true;
        votedFor[msg.sender] = _candidate;
        votes[_candidate] += 1;
    }

    function results() view public returns(address) {
        address current_leader;
        for (uint i=0; i < candidates.length; i++) {
            if (i == 0) {
                current_leader = candidates[i];
            }
            if (votes[candidates[i]] > votes[current_leader]) {
                current_leader = candidates[i];
            }
        }
        return current_leader;
    }

    function voteState() view external returns(bool) {
        return (voted[msg.sender]);
    }

    function userVotedFor() view external returns(address) {
        return (votedFor[msg.sender]);
    }

    // Need function to return full candidates array
    function getCandidates() view public returns(address[] memory) {
        return(candidates);
    }
}