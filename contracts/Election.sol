// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0;

contract Election {

    string public candidate; // declared a state variable
    constructor() public{
        candidate = "candidate1";
    }
}