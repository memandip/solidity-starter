pragma solidity ^0.8.15;

contract MyContract {
    string value;

    constructor() {
        value = "Mandip";
    }

    function get() public view returns (string memory) {
        return value;
    }

    function set(string memory _value) public {
        value = _value;
    }
}
