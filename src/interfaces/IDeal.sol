pragma solidity >=0.8.0;


struct Instance {
    address[] roles; //[incubator, buyer, dealToken, poolAddress]
    uint[] quantities; // 
    uint[] vestStartEnd; //[start,end]
}

interface IDeal {





/// @notice returns the id of the last Deal
function lastID() external view returns (uint256);

}
