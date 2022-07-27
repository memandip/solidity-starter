// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Array - dynamic or fixed size
// Initialization
// Insert (push), get, update, delete, pop, length
// Creating array in memory
// Returing array from function

contract Array {
    uint[] public nums = [1,2,3]; // array initialization
    uint[5] public fixedSizeNums = [1,2,3,4,5]; // fixed sized array

    function examples() external {
        nums.push(4); // [1,2,3,4]
        // fixedSizeNums.push(10);

        uint x = nums[1]; // get value in index
        nums[2] = 77; // update value in index

        // length of array remains the same even after deleting, delete index value is set to its default value
        delete nums[1]; // [1,0,2,4] delete element in index 1 and set to default value

        nums.pop(); // delete the last element of array
        nums.length; // get array length

        // create array in memory
        // it has to be of fixed size
        // only update and retrieving value are available
        uint[] memory a = new uint[](5);
        a[1] = 123;
        // a.pop(); -> throws error
        // a.push(); -> throws error
    }

    // tells solidity to copy arry in memory and return it
    // not recommended
    // bigger the array more gas will be used
    function returnArray() external view returns (uint[] memory) {

    }
}