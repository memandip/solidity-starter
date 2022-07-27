// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ForAndWhileLoops {
    function loops() external pure {
        for(uint i=0;i<10;i++) {
            if(i == 3) {
                continue;
            }

            if(i == 9) {
                break;
            }
        }

        uint i = 0;
        while(i < 10) {
            // some code
            i++;
        }
    }

    function sum(uint _num) external pure returns (uint) {
        uint result = 0;
        uint i = 1;
        while(i <= _num){
            result += i;
            i++;
        }

        return result;
    }
}