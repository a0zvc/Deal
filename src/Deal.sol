// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.12;

import "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "vest_minimal/MiniVest.sol";
import "./interfaces/IRegistry.sol";
import "./interfaces/IDeal.sol";

uint256 constant k = 999999999999999999 * 10 **18;

contract Deal is ERC721("A0Z Deal","DEAL"), MiniVest(k), IDeal {

    IRegistry R;
    IERC20 Stable;

    uint maxID;
    mapping(uint256 => string) _tokenURIs;

    constructor(address R_) {
        R = IRegistry(R_);
        Stable = IERC20(R.opTokenAddress());
    }



function createDeal() public returns (address) {
    // ERC20 d = new DealTokenFactory(4, "a","b");
}



/// Private 

function incrementID() private {
    unchecked { ++ maxID; }
}


//// View

function lastID() public view returns (uint256) {
    return maxID;
}



}
