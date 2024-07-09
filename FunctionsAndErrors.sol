// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

contract CustomToken {
    string public name;
    string public symbol;
    uint256 public supply;
    address public creator;

    event TokensMinted(address indexed recipient, uint256 amount);
    event TokensBurned(address indexed account, uint256 amount);
    event TokensTransferred(address indexed sender, address indexed recipient, uint256 amount);

    error BalanceTooLow(uint256 available, uint256 requested);

    mapping(address => uint256) public balances;

    modifier onlyCreator() {
        assert(msg.sender == creator);
        _;
    }

    constructor() {
        name = "CustomToken";
        symbol = "CTK";
        supply = 0;
        creator = msg.sender;
    }

    function mintTokens(address recipient, uint256 amount) public onlyCreator {
        supply += amount;
        balances[recipient] += amount;
        emit TokensMinted(recipient, amount);
    }

    function burnTokens(address account, uint256 amount) public onlyCreator {
        if (balances[account] < amount) {
            revert BalanceTooLow({available: balances[account],
