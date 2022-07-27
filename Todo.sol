// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Todo {

    struct TodoRow {
        string title;
        bool isCompleted;
    }

    TodoRow[] private todos;

    modifier checkIndex(uint _index) {
        require(_index < todos.length, "index out of bound");
        _;
    }

    function add(string memory _title, bool _isCompleted) external {
        todos.push(TodoRow(_title, _isCompleted));
    }

    function update(uint _index, bool _isCompleted) external checkIndex(_index) {
        todos[_index].isCompleted = _isCompleted;
    }

    function get(uint _index) external view checkIndex(_index) returns(TodoRow memory) {
        return todos[_index];
    }

    function getTodoTitle(uint _index) external view checkIndex(_index) returns (string memory _title) {
        _title = todos[_index].title;
    }

    function getAll() external view returns(TodoRow[] memory) {
        return todos;
    }
}