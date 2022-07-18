// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// global varibables store information such as
// blockchain, transaction and the account that called the function
contract GlobalVariables {
    // view is like pure i.e. readonly function
    // unlike pure view functions can read data from state variables and global variables
    function globalVars() external view returns(address, uint, uint) {
        address sender = msg.sender; // global variable that stored the address of function caller
        uint timestamp = block.timestamp; // unix timestamp of the time when the function was called
        uint blockNum = block.number; // stores the current block number
        return (sender, timestamp, blockNum);
    }
}