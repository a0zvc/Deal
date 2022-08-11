
pragma solidity ^0.8.12;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";

contract DealTokenFactory is ERC20, Ownable {
    
    
    constructor(uint256 initialSupply_, string memory name_, string memory symbol_) ERC20(name_, symbol_) {
       
        _mint(_msgSender(), initialSupply_);
    
    }
}