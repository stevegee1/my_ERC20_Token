// SPDX-License-Identifier: MIT

//This is a fully functional erc20 token contract
//Token name: stevegee
//Token symbol: XXG

//Contracts tested on:
//Rinkeby, Kovan, mainnet-fork. Ganache

//using solidity version 0.8.0-0.8.9
pragma solidity ^0.8.0;

//MY DEPENDENCIES:
//Importing openzeppelin contract for full functionality and security

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

//This is the extention of erc20 that adds cap to the supply of token
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";

//This is the openzeppelin contract that implements the concept of ownership
import "@openzeppelin/contracts/access/Ownable.sol";

//Extension of ERC20 that allows token holders to destroy both their own tokens
//and those that they have an allowance for,
//in a way that can be recognized off-chain (via event analysis).
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

//ERC20 token with pausable token transfers, minting and burning.

//Useful for scenarios such as preventing trades until the end of an evaluation period,
//or having an emergency switch for freezing all token transfers in the event of a largebug.
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol";

contract myToken is ERC20, ERC20Capped, Ownable, ERC20Burnable, ERC20Pausable {
    // According to the erc20 standard the decimal value is 18
    // The initial supply is 1000 XXGs
    uint256 public initialsupply = 1000 * 10**18;

    constructor() ERC20("stevegee", "XXG") ERC20Capped(10000 * 10**18) {
        //the initial supply is minted and sent to this address
        _mint(msg.sender, initialsupply);
    }

    //This token can only be minted by the owner(deployer of the contract)
    function _mint(address account, uint256 amount)
        internal
        override(ERC20Capped, ERC20)
        onlyOwner
    {
        require(
            ERC20.totalSupply() + amount <= cap(),
            "ERC20Capped: cap exceeded"
        );
        super._mint(account, amount);
    }

    function mintMinerReward() public onlyOwner {
        _mint(msg.sender, 100 * 10**18);
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual override(ERC20, ERC20Pausable) {
        super._beforeTokenTransfer(from, to, amount);

        require(!paused(), "ERC20Pausable: token transfer while paused");
    }
}
