// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FunctionIntro {
    // external means it can be called when deployed
    // pure means it is readonly it does not write to blockchain
    function add(uint x, uint y) external pure returns (uint) {
        return x + y;
    }

    function sub(uint x, uint y) external pure returns (uint) {
        return x + y;
    }
}