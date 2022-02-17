pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import "@openzeppelin/contracts/token/ERC721/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract ERC721Passport is ERC721Burnable, AccessControl {

     struct Player {
        string playerId;
        string playerName;
    }
     
    struct DocumentHistory {
        string playerId;
        string hashDocument;
        string updateDate;
    }
    
    mapping(string => Player[]) players; 
    
    mapping(string => DocumentHistory[]) document; 
    
    mapping(string => bool) _passportExists;

    string[] public mintedPassport;

    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    constructor(string memory name, string memory symbol) ERC721(name, symbol) public {
        _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());
        _setupRole(MINTER_ROLE, _msgSender());
    }

    function mint(address to, uint256 tokenId) public {
        require(hasRole(MINTER_ROLE, _msgSender()), "KaleidoERC721Mintable: must have minter role to mint");
        _mint(to, tokenId);
    }

    function mintWithTokenURI(address to, uint256 tokenId, string memory tokenURI) public {
        mint(to, tokenId);
        _setTokenURI(tokenId, tokenURI);
    }

    function _createTokenPassport(string memory _playerId,string memory _namePlayer) public {
        
        require(!_passportExists[_playerId], 'Passport player token already exists!');

        mintedPassport.push(_playerId);

        players[_playerId].push(Player(_playerId, _namePlayer));

        _passportExists[_playerId] = true;

    }

    function _addHistoryDocumentPassport(string memory _playerId,string memory _hashDocument, string memory _updateDate) public {
        
        document[_playerId].push(DocumentHistory(_playerId, _hashDocument,_updateDate));

    }
    
    function _getTokenPassport(string memory _playerId) public view returns (Player[] memory) {
        return players[_playerId];
    }

    function _getHistoryDocumentPassport(string memory _playerId) public view returns (DocumentHistory[] memory) {
        return document[_playerId];
    }

     function _getTokens() public view returns (string[] memory) {
        return mintedPassport;
    }

}
