// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract TestContract1 {
    address public owner = msg.sender;

    function setOwner(address _owner) public  {
        require(msg.sender == owner, "not owner");
        owner = _owner;
    }
}

contract TestContract2 {
    address public owner = msg.sender;
    uint public value = msg.value;
    uint public x;
    uint public y;

    constructor(uint _x, uint _y) {
        x = _x;
        y = _y;
    }
}

contract Proxy {
    event Deploy(address);

    fallback() external payable {}

    // function that can deploy any arbitrary contract
    // passing in the byte code of the contract
    function deploy(bytes memory _code) external payable returns (address addr) {
        assembly {
            // create (v, p, n)
            // v = amount of ETH to send
            // p = pointer in memory to start of code
            // n = size of code
            // defining and assigning
            addr := create(callvalue(), add(_code, 0x20), mload(_code))
        }
        require(addr != address(0), "deploy failed");
        emit Deploy(addr);
    }

    function execute(address _target, bytes memory _data) external payable {
        (bool success, ) = _target.call{value: msg.value}(_data);
        require(success, "failed");
    }
}

contract Helper {
    function getByteCode1() external pure returns (bytes memory) {
        bytes memory bytecode = type(TestContract1).creationDate;
        return bytecode;
    }

    function getByteCode2(uint _x, uint _y) external pure returns (bytes memory) {
        bytes memory bytecode = type(TestContract2).creationDate;
        return abi.encodePacked(bytecode, abi.encode(_x, _y));
    }

    function getCallDate(address _owner) external pure returns (bytes memory) {
        return abi.encodeWithSignature("setOwner(address)", _owner);
    }

}