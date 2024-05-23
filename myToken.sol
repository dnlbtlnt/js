// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CoolToken {
    string public name = "MyCoolToken";
    string public symbol = "COOL";
    uint8 public decimals = 18;
    uint256 public totalSupply = 1000000 * (10 ** uint256(decimals));

    mapping(address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Burn(address indexed from, uint256 value);
    event Mint(address indexed to, uint256 value);

    constructor() {
        balanceOf[msg.sender] = totalSupply; // Yay, free tokens for me!
    }

    function sendCoolness(address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0), "Can't send tokens to nowhere, mate");
        require(balanceOf[msg.sender] >= _value, "Not enough coolness, sorry");

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function burnCoolness(uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value, "Not enough coolness to burn");

        balanceOf[msg.sender] -= _value;
        totalSupply -= _value; // We're getting cooler by the minute
        emit Burn(msg.sender, _value);
        return true;
    }

    function mintCoolness(address _to, uint256 _value) public returns (bool success) {
        totalSupply += _value; // Spreading the coolness
        balanceOf[_to] += _value;
        emit Mint(_to, _value);
        return true;
    }
}
