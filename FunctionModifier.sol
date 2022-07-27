// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Function modifier - reuse code before and / or after function
// Basic, 
// inputs, 
// sandwich
// Function modifier can wrap a function in such a way that some code are executed
// and then the actual function is executed and afterwards more code are executed
contract FunctionModifier {
    bool public paused;
    uint public count;

    function setPause(bool _paused) external {
        paused = _paused;
    }

    modifier whenNotPaused() {
        require(!paused, "paused");
        _; // _ tells solidity to call the actual function it wraps
    }

    function inc() external whenNotPaused {
        count += 1;
    }

    // 
    // function inc() external {
    //     require(!paused, "paused");
    //     count += 1;
    // }

    function dec() external whenNotPaused {
        count -= 1;
    }

    modifier cap(uint _x) {
        require(_x < 100, "x >= 100");
        _;
    }

    function incBy(uint _x) external whenNotPaused cap(_x) {
        count += _x;
    }

    modifier sandwich() {
        // code here
        count += 10;
        _; // actual function call
        // more code here
        count *= 2;
    }

    // function increase count by 10
    // execute actual function
    // execute some more code 
    function foo() external sandwich {

    }
}