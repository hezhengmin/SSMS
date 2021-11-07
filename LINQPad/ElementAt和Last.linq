<Query Kind="Statements">
  <Connection>
    <ID>3d50fecd-8d72-4c77-8507-cbf6ba6f276f</ID>
    <Persist>true</Persist>
    <Server>DESKTOP-D1CFQGS\SQLEXPRESS</Server>
    <Database>Northwind</Database>
    <ShowServer>true</ShowServer>
  </Connection>
</Query>

char[] alpha = {'A','B','C','D'};
int[] money = {1000,1500,1200,900};

Console.WriteLine("Element At Index 1: {0}", alpha.ElementAt(0));
Console.WriteLine("Element At Index 3: {0}", alpha.ElementAt(3));
Console.WriteLine("alpha Last(): {0}", alpha.Last());
Console.WriteLine("money Last(): {0}", money.Last( m=> m >= 1000));


/*
Element At Index 1: A
Element At Index 3: D
alpha Last(): D
money Last(): 1200
*/