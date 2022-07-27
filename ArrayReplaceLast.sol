// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// remove array element by shifiting elements to left
// [1,2,3,4,5,6] -- remove(2) --> [1,2,4,5,6,6] --> [1,2,4,5,6]

contract ArrayReplaceLast {
    uint[] public arr;

    // [1,2,3,4] -- remove(1) --> [1,4,3]
    // [1,4,3] -- remove(2) --> [1,4]
    // does not preserve the index the array
    // but is more efficient
    function remove(uint _index) public {
        arr[_index] = arr[arr.length-1];
        arr.pop();
    }

    function test() external {
        arr = [1,2,3,4];
        remove(1);

        // [1,4,3]
        assert(arr.length == 3);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
        assert(arr[2] == 3);

        remove(2);

        // [1,4]
        assert(arr.length == 2);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
    }
}