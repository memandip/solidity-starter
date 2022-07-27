// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Insert, update, read from array of structs
contract TodoList {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string calldata _text) external {
        todos.push(Todo({
            text: _text,
            completed: false
        }));
    }

    function updateText(uint _index, string calldata _text) external {
        // 35138 gas
        // todos[_index].text = _text;
        // todos[_index].text = _text;
        // todos[_index].text = _text;
        // todos[_index].text = _text;

        // 34578 gas
        // Todo storage todo = todos[_index];
        // todo.text = _text
        // todo.text = _text
        // todo.text = _text
        // todo.text = _text

        // when there is less fields to update
        // it is the ideal solution
        todos[_index].text = _text;
        
        // when there is more fields to update
        // it is the ideal solution
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    function get(uint _index) external view returns (string memory, bool){
        // storage - 29397
        // memory - 29480
        Todo memory todo = todos[_index];

        return (todo.text, todo.completed);
    }

    function toggleCompleted(uint _index) external {
        todos[_index].completed = !todos[_index].completed;
    }
}