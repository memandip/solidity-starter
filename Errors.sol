// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// 
// Three was to throw error require, revert, assert
// when a error is thowing in smart contract - gas refund, state updates are reverted
// custom error - save gas
contract Error {
    function testRequire(uint _i) public pure {
        require(_i <= 10, "i > 10"); // _i <= 10 -> condition, "i > 10" error
    }

    function testRevert(uint _i) public pure {
        if(_i > 10) {
            revert("i > 10");
        }
    }

    uint public num = 123;
    function testAssert() public view {
        assert(num == 123);
        // it will throw after calling foo
    }

    function foo(uint _i) public {
        // accidently update num
        num += 1;
        require(_i < 10);
    }

    error MyError(address caller, uint i);
    function testCustomError(uint _i) public view {
        // require(_i <= 10, "very very long error message messasge error"); uses more gas
        if (_i > 10) {
            revert MyError(msg.sender, _i);
        }
    }
}