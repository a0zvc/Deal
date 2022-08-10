pragma solidity >=0.8.0;


import "openzeppelin-contracts/contracts/token/ERC721/IERC721.sol";


struct Instance {
    address[] roles; //[incubator, buyer, dealToken, poolAddress]
    uint[] quantities; // 
    uint[] vestStartEnd; //[start,end]
}


interface IDeal is IERC721 {





/// @notice returns the id of the last Deal
function lastID() external view returns (uint256);


}
