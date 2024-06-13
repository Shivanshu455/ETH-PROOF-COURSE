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

contract myCustomToken {
    // define public variables to store the token details
    string public tokenName = "CustomToken";
    string public tokenAbbrv = "CST";
    uint public totalSupply = 0;

    // Mapping to track balances of our token
    mapping(address => uint) public addressBalances;

    // Function will help us to crete new token
    function generateTokens(address _address, uint _amount) public {
        totalSupply += _amount;
        addressBalances[_address] += _amount;
    }

    // Function help us to destroy existing tokens
    function destroyToken(address _address, uint _amount) 
    public {
        if (addressBalances[_address] >= _amount) {
            totalSupply -= _amount;
            addressBalances[_address] -= _amount;
        }
    }
}
