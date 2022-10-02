// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract FeeCollector { 
    address public owner; // sets the data type of owner as address 
    uint256 public balance; // sets the data type of balance as an unsigned integer

    
    constructor() {
        owner = msg.sender; // utilizing an constructor to initialize contract
    }

    
    receive() external payable {
        balance += msg.value; // sets balance to the sum of its current value and msg.value
    }

    
    function withdraw(uint256 amount, address payable destAddr) public { // sends ETH to given address
        
        require(msg.sender == owner, "Only owner may withdraw!"); // checks if msg.sender is owner
        
        require(amount <= balance, "You have insufficient funds!"); // checks if the balance of the account is greater than the amount it is trying to send
        
        
        destAddr.transfer(amount); // ETH is sent to the given address after verification 
        
        balance -= amount; // the sent amount is deducted from balance
    }
}