// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract MyToken {

    string public name; // Public variables to store token details
    string public symbol; 
    uint256 public totalSupply; 

    mapping(address => uint256) public balances; // Mapping to store balances of addresses

    constructor(string memory _name, string memory _symbol, uint256 _initialSupply) {
        name = _name;
        symbol = _symbol;
        totalSupply = _initialSupply;
        balances[msg.sender] = _initialSupply; // Assign the initial supply to the contract creator
    }

    function mint(address _to, uint256 _amount) public {
        require(_to != address(0), "Mint to the zero address"); // Prevent minting to the zero address
        totalSupply += _amount;
        balances[_to] += _amount;
        emit Transfer(address(0), _to, _amount); // Emit a Transfer event from the zero address
    }

    function burn(address _from, uint256 _amount) public {
        require(_from != address(0), "Burn from the zero address"); // Prevent burning from the zero address
        require(balances[_from] >= _amount, "Insufficient balance to burn"); // Ensure the balance is sufficient to burn

        totalSupply -= _amount;
        balances[_from] -= _amount;
        emit Transfer(_from, address(0), _amount); // Emit a Transfer event to the zero address
    }

    event Transfer(address indexed from, address indexed to, uint256 value); // Event to log transfers, including minting and burning
}
