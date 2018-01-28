pragma solidity ^0.4.0;

contract Coin {

    address public minter;
    mapping(address => uint) public balances;

    event Sent(address _from, address _to, uint amount);

    function Coin() public {
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public {
        //if(balances[msg.sender] < amount) return;
        require(balances[msg.sender] > amount);
        balances[msg.sender] -= amount;
        balances[receiver] += amount;

        Sent(msg.sender, receiver, amount);
    }
}
