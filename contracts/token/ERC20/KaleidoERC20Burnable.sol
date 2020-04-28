pragma solidity ^0.6.2;

import "@openzeppelin/contracts/token/ERC20/ERC20Burnable.sol";

contract KaleidoERC20Burnable is ERC20Burnable {
    constructor(string memory name, string memory symbol, uint8 decimals, uint256 initialSupply) ERC20(name, symbol) public {
        _setupDecimals(decimals);
        _mint(_msgSender(), initialSupply * 10**uint(super.decimals()));
    }
}