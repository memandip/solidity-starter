// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// 2 ways to call parent constructors
// Order of initialization
contract S {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract T {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

// When we already know what the parameter to pass to the parent constructor
// we can pass in directly during inheritance
// only only when we know the inputs to pass in the constructors  while writing the code
contract U is S("s"), T("t") {
    
}

// But if you want to pass in parameters that are to be determined
// when you deploy your contract, there's another way
// it can be used to pass dynamic input to the constructor
contract V is S, T {
    constructor(string memory _name, string memory _text) S(_name) T(_text) {

    }
}

// Can be used in combination of both
contract VV is S("s"), T {
    constructor(string memory _text) T(_text) {

    }
}

// The order of execution of parent constructor is not determined by the order of parent
// contract that we call in child constructor
// it is determined by the order of inheritance

// Order of execution
/*
1. S
2. T
3. V0
*/
contract V0 is S, T {
    constructor(string memory _name, string memory _text) S(_text) T(_name) {

    }
}

// Order of execution
/*
1. S
2. T
3. V1
*/
contract V1 is S, T {
    constructor(string memory _name, string memory _text) T(_name) S(_text) {

    }
}

// Order of execution
/*
1. T
2. S
3. V2
*/
contract V2 is T, S {
    constructor(string memory _name, string memory _text) T(_name) S(_text) {

    }
}

// Order of execution
/*
1. T
2. S
3. V1
*/
contract V3 is T, S {
    constructor(string memory _name, string memory _text) S(_text) T(_name) {

    }
}