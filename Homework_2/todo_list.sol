// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract TodoList {
    struct Todo {
        string text;
        bool completed;
    }
    
    Todo[] public todos;

    // creates a todo array
    function create(string calldata _text) external {
        // pushes _text into the todo array
        todos.push(Todo({
            text: _text,
            completed: false
        }));
    }

    // updates the description of the specificed index of the array
    function updateText(uint _index, string calldata _text) external {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    function get(uint _index) external view returns(string memory, bool) {
        Todo memory todo = todos[_index];
        return (todo.text, todo.completed);
    }

    // marks completed and incompleted items
    function toggleCompleted(uint _index) external {
        todos[_index].completed = !todos[_index].completed;
    }
}