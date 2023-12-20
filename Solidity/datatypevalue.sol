// SPDX-License-Identifier: GPL-3.0 
pragma solidity >=0.4.16 <0.9.0;

contract datatypevalue{

    //booleanos
    bool verdadero = true;
    bool falso = false;
    
    //Enteros: Int= enteros con signo. y entero sin signo uint

    int number1 = -8; //hasta 256 bits.
    //Definir cuantos bits voy a necesitar, esto para ahorrar recursos.
    //int32
    int32 number3 = 10; //aca delimito cuantos espacios necesito. En este caso 32 bits

    //Entero sin signo.
    uint number2 = 4;
    uint32 number4= 15;
    
    //Convers between data type
    int numbnegativo =-4;
    uint numeropositivo =uint(numbnegativo); // con este yo convierto desde un negativo a un positivo.

    //Address es un tipo de cuenta, una llave. Una dirección en la blockchain.
    //Address del contract acount. Esto es la dirección del contracto. -CONTRACT
    address public AddressAcoun = address(this);
    //Address externally owned account. Es una cuenta del usuario. Es pública.
    //address: 0xf8e81D47203A594245E36C48e151709F0C19fBe8

    address public addressExternally = msg.sender; //Aca mando llamar a otra address externa -PERSONA
    //address: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4

    //Tambien en una address tiene propiedades.
    //uint public balanceAccount =addressAcoun.balanceAccount; //esto es para saber el total del balance de la address public
    //STRING
    string public hello = "hello world";

    //byte
    //1 byte- 8 bits
    bytes1 dato ="9";
    //32 bytes
    bytes32 public dato2= "hello world";

    //tipos de datos de referencia: 
    //array es un arreglo. y struct. tipos definidos por el usuario y los arrays es una colección de datos de un mismo tipo.
    
}