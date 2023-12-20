// SPDX-License-Identifier: GPL-3.0 
pragma solidity ^0.8.0;

contract Coin {

    //Cuenta para el minter
    address public minter;

    //Guarda los balances de mi coin 
    //{Liz:10 Coin}
    //{Pablo:20 Coin}
    mapping (address => uint) public balances;

    //La primera cuenta que ejecuta el contrato,se asigna como minter
    constructor(){
        minter = msg.sender;
    }   


    //Evento que notifica que se envió
    event Sent (address from, address to, uint amount);

    error InsufficienteBalance(address from, uint amount);


    //Asigna mis coins a una cuenta y a un amount
    function mint(address receiver, uint amount) public {
        
        //Solo sea ejecutada por el minter
        require(minter == msg.sender, "El sender no es el minter");

        //Asignar el amount al receiver
        balances[receiver] += amount;
    }

    //Envía coins ya existentes 
    function send(address receiver, uint amount) public {

        //Confirmar que sender tenga el amount que quiero mandar
        require(balances[msg.sender] >= amount, "Monto Insuficiente");

        if (amount > balances[msg.sender]) {
            revert InsufficienteBalance(msg.sender, amount);
        }

        //Restar al balance del sender, el amount que vaya a enviar
        balances[msg.sender] -= amount;
        
        //Sumarle a receiver, el amount
        balances[receiver] += amount;

        emit Sent(msg.sender, receiver, amount);
        
    }



    //Minter
    //0x5B38Da6a701c568545dCfcB03FcB875f56beddC4

    //Receiver
    //0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
    //0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db

    

}
