// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// events allow you to write the data in the blockchain
// these data cannot be later retrived by smart contract
// the main purpose of the event is to log that something happened
// so it can't be a the cheap alternative of storing data as a state variable
// if the data that you want to be storing is something that you want to save on the blockchain once
// and later on the smart contract does not have to retieve it
contract Event {
    event Log(string message, uint val);
    // upto 3 index
    event IndexedLog(address indexed sender, uint val);

    function example() external {
        emit Log("Sending 10 eth", 10);
        emit IndexedLog(msg.sender, 999);
    }

    // now this smart contract can send anyone a message
    // this message will be public meaning anyone having access to the blockchain
    // will be able to see this message
    event Message(address indexed _from, address indexed _to, string message);

    // to send the message we have to send a transaction
    // so you have to pay for every message you send
    function sendMessage(address _to, string calldata message) external {
        emit Message(msg.sender, _to, message);
    }

}