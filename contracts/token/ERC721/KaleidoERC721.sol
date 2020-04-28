pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract KaleidoERC721 is ERC721 {
    constructor() ERC721("MyNFT", "MNFT") public {
    }
}