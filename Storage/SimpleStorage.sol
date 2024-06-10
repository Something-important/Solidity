
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract SimpleStorage {
    mapping(string => uint256) public nameToFavoriteNumber;
    string[] public keys;

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        nameToFavoriteNumber[_name] = _favoriteNumber;
        keys.push(_name);
    }

    function getFavoriteNumber(string memory _name) public view returns (uint256) {
        return nameToFavoriteNumber[_name];
    }

    function getKeys() public view returns (string[] memory) {
        return keys;
    }
}