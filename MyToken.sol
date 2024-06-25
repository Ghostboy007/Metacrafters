// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract MyToken {

    string public name;
    string public symbol;
    uint256 public totalSupply;
    mapping(address => uint256) public balances;

    constructor(string memory _name, string memory _symbol, uint256 _initialSupply) {
        name = _name;
        symbol = _symbol;
        totalSupply = _initialSupply;
        balances[msg.sender] = _initialSupply;
    }

    function mint(address _to, uint256 _amount) public {
        require(_to != address(0), "Mint to the zero address");
        totalSupply += _amount;
        balances[_to] += _amount;
        emit Transfer(address(0), _to, _amount);
    }

    function burn(address _from, uint256 _amount) public {
        require(_from != address(0), "Burn from the zero address");
        require(balances[_from] >= _amount, "Insufficient balance to burn");
        totalSupply -= _amount;
        balances[_from] -= _amount;
        emit Transfer(_from, address(0), _amount);
    }

    event Transfer(address indexed from, address indexed to, uint256 value);
}
