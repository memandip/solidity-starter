// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract LocalVariables {
    // these variable will be available even after execution
    uint public i;
    bool public b;
    address public myAddress;

    function foo() external {
        // these variable will only available inside this function
        uint x = 123;
        bool f = false;
        // more code
        x += 456;
        f = true;

        i = 123;
        b = true;
        myAddress = address(1);
    }
}