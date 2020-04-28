pragma solidity ^0.6.2;

import "@openzeppelin/contracts/token/ERC721/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract KaleidoERC721MintableBurnable is ERC721Burnable, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    constructor(string memory name, string memory symbol) ERC721(name, symbol) public {
        _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());
        _setupRole(MINTER_ROLE, _msgSender());
    }

    function mint(address to, uint256 amount) public {
        require(hasRole(MINTER_ROLE, _msgSender()), "KaleidoERC721MintableBurnable: must have minter role to mint");
        _mint(to, amount);
    }
}