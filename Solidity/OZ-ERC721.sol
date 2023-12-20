// contracts/GameItem.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract OZERC721 is ERC721URIStorage {
    uint256 private _nextTokenId;

    constructor() ERC721("BENTokens", "BRC") {}

    function init(address _to, string memory tokenURI)
        public
        returns (uint256)
    {
        uint256 tokenId = _nextTokenId++;
        _mint(_to, tokenId);
        _setTokenURI(tokenId, tokenURI);

        return tokenId;
    }
}