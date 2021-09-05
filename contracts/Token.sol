//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title Token
 * @author pegah
 * @notice Token contract
 */
contract Token {
    // we can reference it directly
    string public name;
    string public symbol;
    //cannot have decimals, we need to convert 21 million tokens to uint256 with eth to wei
    uint256 public totalSupply = 21000000000000000000000000;

    //our owner will control initial transfers
    address public owner;

    //type of key and value
    //public means an automatic getter not that anyone can set this value
    mapping(address => uint256) public balances; //who has what amount of coins on this contract

    //when we have a token we recieve that in our wallet, in smart contracts we dont have any way of moving tokens so when we are recieving the token we change the amount of tokens the owner owns the balances in this contract
    //with ether it actually sends ether to another account

    //assign supply to the owner
    constructor(string memory inputName, string memory inputSymbol) {
        name = inputName;
        symbol = inputSymbol;
        balances[msg.sender] = totalSupply;
        owner = msg.sender; //whoever deploys this contract will be the owner
    }

    /**
     * @notice sends the specified amount of tokens to the given recipient
     * @dev sender must have balance they try to transfer emits an event describing the amount transferred
     * @param to address of recipient
     * @param amount amount of pegah token to transfer
     */
    function transfer(address to, uint256 amount) external {
        require(balances[msg.sender] >= amount, "Not enough balance");
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }
}
