// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// When we use a dynamic data type as variable we need to declare its data location
// Data locations - storage, memory and calldata
// storage means that the variable is state variable -> to modify data even after execution completes
// memory means that the data is loaded onto memory -> mainly for readonly data 
// calldata is like memory except it can be only used for function inputs
//  -> it can save gas
//  -> the values are non-modifable, the data passed as calldata cannot be modified in function
contract DataLocations {
    struct MyStruct {
        uint foo;
        string text;
    }

    mapping(address => MyStruct) public myStructs;

    function examples(uint[] memory y, string memory s) external returns (MyStruct memory, uint[] memory) {
        myStructs[msg.sender] = MyStruct({foo:123, text: "bar"});

        // telling solidity that the variable myStruct should point back to storage
        // meaning state variable
        // if we only want to read data then can use memory instead of storage
        // wee need storage to be able to modifify state variables
        MyStruct storage myStruct = myStructs[msg.sender];
        myStruct.text = "foo";

        // since the data is loaded onto memory
        // once the function is done executing the change will not be saved
        MyStruct memory readOnlyMyStruct = myStructs[msg.sender];
        readOnlyMyStruct.foo = 456;

        uint[] memory memArr = new uint[](3);
        memArr[0] = 1;
        memArr[1] = 2;
        memArr[2] = 3;

        return (readOnlyMyStruct, memArr);
    }

    function calldataExamples(uint[] calldata y) external returns (uint x) {
        x = y[0];
    }
}