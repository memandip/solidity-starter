// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Constructor {
    address public owner;
    uint public x;

    // contructor is mainly used to initialze the state variables
    // only called once when the contract is being deployed
    constructor(uint _x) {
        owner = msg.sender;
        x = _x;
    }
}