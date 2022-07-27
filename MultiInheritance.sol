// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Order of inheritance - most base like to derived
// most base like is contract that inherits the least
/*
   X
 / |
Y  |
 \ |
   Z

// order of most base like to derived
// X, Y, Z

    X
  /   \
 Y     A
 |     |
 |     B
  \   /
    Z
order of Y and A does not matter
as they have same base like     
X, Y, A, B, Z
*/

contract X {
    function foo() public pure virtual returns (string memory) {
        return "X";
    }

    function bar() public pure virtual returns (string memory) {
        return "X";
    }

    function x() public pure returns (string memory) {
        return "X";
    }
}

contract Y is X {
    function foo() public pure virtual override returns (string memory) {
        return "Y";
    }

    function bar() public pure virtual override returns (string memory) {
        return "Y";
    }

    function y() public pure returns (string memory) {
        return "Y";
    }
}

// multiple inheritance from most base like
// to derived parent contract
// will not compile if the order is not correct
contract Z is X, Y {
    // order doesn't matter in override
    function foo() public pure override(X,Y) returns (string memory) {
        return "Z";
    }

    function bar() public pure override(X,Y) returns (string memory) {
        return "Z";
    }
}