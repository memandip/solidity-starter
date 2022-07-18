// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// There are three types of variables in solidity
// local, state and global

// State variables are variable that are stored in blockchain and will be available after
// They are declared in a contract outside of any function
// Variables declared inside function are local variables

contract StateVariables {
    uint public myUint; // state variable
    
    // will be gone after execution 
    function foo() external pure returns (uint){
        uint notStateVariable = 345;
        return notStateVariable;
    }
}