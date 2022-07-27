// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract IterableMapping {
    mapping(address => uint) public balances;
    mapping(address => bool) public inserted;
    address[] public keys;

    modifier checkIndex(uint _i) {
        require(_i < keys.length, "index out of bound");
        _;
    }

    function set(address _key, uint _val) external {
        balances[_key] = _val;

        if(!inserted[_key]) {
            inserted[_key] = true;
            keys.push(_key);
        }
    }

    function getSize() external view returns (uint) {
        return keys.length;
    }

    function first() external view returns (uint) {
        return balances[keys[0]];
    }

    function last() external view returns (uint) {
        return balances[keys[keys.length - 1]];
    }

    function get(uint _i) external checkIndex(_i) view returns (uint) {
        return balances[keys[_i]];
    }
}