// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Enum {
    enum Status {
        None, // 0
        Pending, // 1
        Shipped, // 2
        Completed, // 3
        Rejected, // 4
        Canceled // 5
    }

    Status public status;

    struct Order {
        address buyer;
        Status status;
    }

    Order[] public orders;

    function get() view external returns (Status) {
        return status;
    }

    function set(Status _status) external {
        status = _status;
    }

    function ship() external {
        status = Status.Shipped;
    }

    function reset() external {
        // reset status state variable to its default
        // which will be the first item defined on the enum
        delete status; 
    }
}