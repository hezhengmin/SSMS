<Query Kind="Statements" />

int[] numbers  = { 1, 2, 3, 4, 5 };
Console.WriteLine(numbers.ElementAt(2));//3
//Console.WriteLine(numbers.ElementAt(10)); 超出索引
Console.WriteLine(numbers.ElementAtOrDefault(10)); //0 = default(int)
