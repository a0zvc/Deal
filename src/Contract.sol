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

    constructor(address R_) {
        R = IRegistry(R_);
        Stable = IERC20(R.opTokenAddress());
    }


function lastID() public view returns (uint256) {
    return 11111;
}

}
