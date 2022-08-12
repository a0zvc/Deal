pragma solidity >=0.8.0;


import "openzeppelin-contracts/contracts/token/ERC721/IERC721.sol";



struct Instance {
    address[5] roles; //[daoIncubator, buyer, governor, projectToken, poolAddress]
    uint[3] quantities; //[pool1, pool2, governorAllowance, dealPrice]
    uint[4] vestData; //[incubator, governor, buyer]
    string metaData; 
}
/// vesting mapping [projectERC20 => beneficiary => vestData ]  - assigned on sea;


interface IDeal is IERC721 {

    /// @notice returns the id of the last Deal
    function lastID() external view returns (uint256);



}
