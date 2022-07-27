// SPDX-License-Idenfifier: MIT
pragma solidity ^0.8.7;

// state and local variables have default values
// if we don't assign value to those variables it will have default value
contract DefaultValues {
    bool public b; // default value for the boolean is false
    uint public u; // default value for uint is 0
    int public i; // default value for int is 0
    address public a; // same as address(0) => sequence of 40 zeros 0x0000000000000000000000000000000000000000;
    bytes32 public b32; // sequence of 64 zeros -> 0x0000000000000000000000000000000000000000000000000000000000000000
}