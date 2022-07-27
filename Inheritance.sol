// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// virtual keywords means that these functions can be inherited
// and customised by the child contract
contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }

    function bar() public pure virtual returns (string memory) {
        return "A";
    }

    // will be inherited but cannot be modified in child contract
    function baz() public pure returns (string memory) {
        return "A";
    }
}

contract B is A {
    function foo() public pure override returns (string memory) {
        return "B";
    }

    function bar() public pure virtual override returns (string memory) {
        return "B";
    }
}

contract C is B {
    function bar() public pure override returns (string memory) {
        return "C";
    }
}