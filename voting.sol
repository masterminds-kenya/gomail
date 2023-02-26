// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    // structure for storing voter details
    struct Voter {
        bool voted;
        uint8 vote;
    }
    
    // mapping to store all registered voters
    mapping(address => Voter) public voters;
    
    // candidate names and vote counts
    string[] public candidateNames;
    uint256[] public candidateVotes;
    
    // event emitted when a vote is cast
    event Vote(address indexed voter, uint8 candidateIndex);
    
    // constructor to initialize candidate names
    constructor(string[] memory _candidateNames) {
        candidateNames = _candidateNames;
        candidateVotes = new uint256[](_candidateNames.length);
    }
    
    // function to register a voter
    function registerVoter(address _voterAddress) public {
        require(!voters[_voterAddress].voted, "Voter has already voted.");
        voters[_voterAddress] = Voter(false, 0);
    }
    
    // function to cast a vote
    function castVote(uint8 _candidateIndex) public {
        Voter storage sender = voters[msg.sender];
        require(!sender.voted, "You have already voted.");
        require(_candidateIndex < candidateNames.length, "Invalid candidate index.");
        sender.voted = true;
        sender.vote = _candidateIndex;
        candidateVotes[_candidateIndex]++;
        emit Vote(msg.sender, _candidateIndex);
    }
    
    // function to get the total number of votes
    function getTotalVotes() public view returns (uint256) {
        uint256 totalVotes = 0;
        for (uint8 i = 0; i < candidateVotes.length; i++) {
            totalVotes += candidateVotes[i];
        }
        return totalVotes;
    }

    function setScore(){

        uint256 amount = 10
    }

    event Createuser(uint amount , string name)

    struct user{
        uint256 amount;
        string name;
        uint value;
    }
    
    //
