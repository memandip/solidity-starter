// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Both are readonly function
// The only difference is that view can read the data from the blockchain
// It reads data from state variables, smart contract or blockchain
contract ViewAndPureFunction {
    uint public num;

    function viewFunc() external view returns (uint) {
        return num;
    }

    function pureFunc() external pure returns (uint) {
        return 1;
    }

    function addToNum(uint x) external view returns (uint) {
        return x + num;
    }

    function add(uint x, uint y) external pure returns (uint) {
        return x + y;
    }

}