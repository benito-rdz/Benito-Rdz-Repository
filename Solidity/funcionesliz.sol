// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract DataTypeReference {

    //Arrays 
    //[0,1,2,3,4]
    //Arrays Fijos 
    uint[3] numeros; 

    //Arrays Dinámicos
    int[] numeros2;

    //Propiedades de Arrays
    uint public numeroTamanio = numeros.length;

    //Struct 
    //Definiiendo el struct
    struct Persona{
        string name; 
        uint8 edad; 
        bool aprobado;
    }

    //Instanciando el struct
    Persona public per1 = Persona("Liz", 23, true);

    string public nameReturn = per1.name;


    //Mapping - Clave:Valor
    //{0x1: 100}
    //{0x2: 10}
    //{0x3: 30}
    //{0x4: 40}

    mapping (address => int) diccEnteros;

    mapping (address => Persona) public diccPersonas; 

    function addPersona() public{
        diccPersonas[msg.sender] = per1;
    }

}




