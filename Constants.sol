// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// When using constant we can reduce the execution gas cost of the function
// In this case calling MY_ADDRESS consts 21371 gas 
contract Constants {
    address public constant MY_ADDRESS = 0x7777099779079923972379872593759292835BBd;
    uint public constant MY_UINT = 123;
}

// calling MY_ADDRESS costs 21371 gas
contract Var {
    address public MY_ADDRESS = 0x7777099779079923972379872593759292835BBd;
}