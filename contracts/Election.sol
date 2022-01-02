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
}