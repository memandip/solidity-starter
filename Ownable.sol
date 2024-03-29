// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// state variables
// global variables
// function modifier
// function
// error handling
// Basic contract with onlyOwner modifier, some methods can only be called by owner
// can be used to change owner or ownership of contract
contract Ownable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    function setOwner(address _newOwner) external onlyOwner {
        require(_newOwner != address(0), "invalid address");
        owner = _newOwner;
    }

    function onlyOwnerCanCallThisFunc() external onlyOwner {
        // code
    }

    function anyoneCanCall() external {
        // code
    }
}