// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0;
import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract mockDAI is ERC20("mockDAI","mDAI") {

    constructor(){
        _mint(msg.sender,(10019991 * 10 ** 18));
        _mint(address(1337),(10011 * 10 ** 18));
        _mint(address(306),(900001 * 10 ** 18));
    }
}

// import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
// import "uniswapv2-solc0.8/contracts/interfaces/IERC20.sol";
