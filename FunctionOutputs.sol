// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Return multiple outputs
// Named outputs
// Destructuring Assignments

contract FunctionOutputs {
    function returnMany() public pure returns (uint, bool) {
        return (1, true);
    }

    function named() public pure returns (uint x, bool b) {
        // return 
    }

    function assigned() public pure returns (uint x, bool b) {
        x = 1;
        b = true;
        // return (1, true) -> above will get same result with less gas cost
    }

    function destructuringAssignments() public pure {
        (uint x, bool b) = returnMany();
        (, bool _b) = returnMany(); // omitting 1st value
    }
}