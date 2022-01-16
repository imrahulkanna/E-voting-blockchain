// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0;

contract Election {
    //model a candidate
    struct Candidate {
        uint cId;
        string name;
        uint voteCount;
    } // creating a structure for candidate whic contains name, id and votecount

    //store candidate
    mapping(uint => Candidate) public candidates;  //mapping maps/associates a data type to another
    // here we are mapping candidatesCount(uint) to Candidate(struct) [similar to dict in python(key-value pair)]

    //store Candidate count(because we cant know the size of the mappping anfd we cant iterate over the mapping)
    uint public candidatesCount;

    // store accounts that have already voted
    mapping(address => bool) public voters;

    // add candidate function
    function addCandidate (string memory _name) private { //we are using private on this function because we dont want anyothers to add candidates
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount,_name,0);
    }

    //constructor
    constructor() public{
        addCandidate("GOKU");
        addCandidate("SAITAMA");
    }

    // voted event
    event votedEvent (
        uint indexed _candidateId
    );

    function vote(uint _candidateId) public {
        // the statements below require(condition) will get executed only if the condition is 'true'
        
        //require that they haven't voted before 
        require(!voters[msg.sender]); // voters[msg.sender] returns false(since the voter hasnt voted) so to make it true we use'!'

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount); // checks whether the candidate is within the candidateId list

    // To access the accounts in truffle test use
    // web3.eth.getAccounts().then(function(acc) {acounts=acc;})
    // accounts (this will print the list)

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate  vote count
        candidates[_candidateId].voteCount++;

        // trigger voted Event
        emit votedEvent(_candidateId);
    }
}