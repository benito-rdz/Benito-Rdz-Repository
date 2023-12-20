// SPDX-License-Identifier: GPL-3.0 
pragma solidity >=0.4.16 <0.9.0;

contract DataTypeReference{

//arrays
//arrays fijos solo guarda datos fijos.
uint [3] numeros; //aca le digo que es un array de 3

//arrays dinámicos
int [] nuemero2; //aca lo dejo abierto
//Propiedades de los arrays
uint  public numerotamanio = numeros.length;

//struct Puede guardar diferentes tipos
struct persona {
    string  name;
    uint8  edad;
    bool aprobado;
}
//instanciando el struct
persona  public per1= persona("liz", 23, true);

//Voy a hacer una variable para guardar el nombre
string public namereturn =per1.name;

//Maping: es una clave: valor     Es un diccionario de clave valor
mapping (address => int) diccEnteros;

mapping (address=> persona)  public diccpersona;

function addpersona () public { // asginar a mi mapping la persona.
    diccpersona[msg.sender] = per1;
}

}
