// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;
/*
       REQUIREMENTS
    1. Your contract will have public variables that store the details about your coin (Token Name, Token Abbrv., Total Supply)
    2. Your contract will have a mapping of addresses to balances (address => uint)
    3. You will have a mint function that takes two parameters: an address and a value. 
       The function then increases the total supply by that number and increases the balance 
       of the “sender” address by that amount
    4. Your contract will have a burn function, which works the opposite of the mint function, as it will destroy tokens. 
       It will take an address and value just like the mint functions. It will then deduct the value from the total supply 
       and from the balance of the “sender”.
    5. Lastly, your burn function should have conditionals to make sure the balance of "sender" is greater than or equal 
       to the amount that is supposed to be burned.
*/

contract MyToken {

   constructor() {
    owner = msg.sender;
   }
    // public variables here
string public tokenName = "META";
string public tokenAbbrv = "MTA";
uint public totalSupply = 0;
address public owner;

event Mint(address indexed to, uint amount);
event Burn(address indexed from, uint amount);
event Transfer(address indexed from, address indexed to, uint amount);

error InsufficientBalance(uint balance, uint withdrawAmount);

mapping(address => uint ) public balances;

modifier onlyOwner {
    assert(msg.sender == owner);
    _;
}

function mint (address  _address , uint _value ) public  onlyOwner{

    totalSupply += _value ;
    balances[_address] += _value;
    emit Mint(_address, _value);
}

function burn (address _address , uint _value) public onlyOwner{
    
    if(balances[_address] < _value){
        revert InsufficientBalance({balance: balances[_address], withdrawAmount: _value});
        }
    else{
        totalSupply -= _value ;
        balances[_address] -= _value;
        emit Burn(_address, _value);
    }
    
}
function transfer (address _reciver , uint _value) public {
    require(balances[msg.sender] >= _value , "Account balance must be greater than transfered value!");
    balances[msg.sender] -= _value;
    balances[_reciver] += _value;
    emit Transfer(msg.sender, _reciver, _value);
}



}
