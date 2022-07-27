// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/*
calling parent functions
- direct -> calls only specified parent contract
- super -> it calls all parent contracts (when inheritated from multiple contracts)

    E
  /   \
 F     G
  \   /
    H
*/

contract E {
    event Log(string message);

    function foo() public virtual {
        emit Log("E.foo");
    }

    function bar() public virtual {
        emit Log("E.bar");
    }
}

contract F is E {
    function foo() public virtual override {
        emit Log("F.foo");
        E.foo();
    }

    function bar() public virtual override {
        emit Log("F.bar");
        super.bar();
    }
}

contract G is E {
    function foo() public virtual override {
        emit Log("G.foo");
        E.foo();
    }

    function bar() public virtual override {
        emit Log("G.bar");
        super.bar();
    }
}

contract H is F, G {
    // it will only call foo function of F contract
    function foo() public override(F, G) {
        F.foo();
    }

    // it will call all parent 
    function bar() public override(F, G) {
        super.bar();
    }
}