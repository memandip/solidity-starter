// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract SimpleStorage {
    string public text;

    function set(string calldata _text) external {
        text = _text;
    }

    // when we call the function solidity will copy the state variable text
    // into memory and return it as a string loaded onto memory 
    function get() external view returns (string memory) {
        return text;
    }
}