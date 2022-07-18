// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Counter {
    uint public count;

    // not view or pure function because we are modifying state variable count
    function increment() external {
        count += 1;
    }

    function decrement() external {
        count -= 1;
    }
}