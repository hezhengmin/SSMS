<Query Kind="Program" />

class PetOwner{
	public string Name  {get;set;} 
	public List<Pet> Pets {get;set;} 
}
class Pet{
	public string Name  {get;set;} 
	//品種
	public string Breed {get;set;} 
}

void Main()
{
   PetOwner[] petOwners =
   {
	   new PetOwner{
		　Name = "王五",
		  Pets =  new List<Pet>{
		  	new Pet {Name = "A",Breed = "貴賓犬"},
		  	new Pet {Name = "B",Breed = "獵犬"},
		  }
	   },
	   new PetOwner{
		　Name = "李四",
		  Pets =  new List<Pet>{
		  	new Pet {Name = "C",Breed = "牧羊犬"},
		  	new Pet {Name = "D",Breed = "獵犬"},
		  }
	   },
	   new PetOwner{
		　Name = "張三",
		  Pets =  new List<Pet>{
		  	new Pet {Name = "E",Breed = "牧羊犬"},
		  	new Pet {Name = "F",Breed = "臘腸犬"},
		  }
	   },
   };
   
   var list = petOwners.SelectMany(petOwner => petOwner.Pets,
   (petOwner,pets)=>new {petOwner,pets})
   .Select(ownerAndPet =>
                new
                {
                    Owner = ownerAndPet.petOwner.Name,
                    PetName = ownerAndPet.pets.Name,
                    PetBreed = ownerAndPet.pets.Breed
                }
   );
   
   foreach (var obj in list)
    {
        Console.WriteLine($"主人名字：{obj.Owner}，寵物名字：{obj.PetName}，品種：{obj.PetBreed}");
    }
}
/*
主人名字：王五，寵物名字：A，品種：貴賓犬
主人名字：王五，寵物名字：B，品種：獵犬
主人名字：李四，寵物名字：C，品種：牧羊犬
主人名字：李四，寵物名字：D，品種：獵犬
主人名字：張三，寵物名字：E，品種：牧羊犬
主人名字：張三，寵物名字：F，品種：臘腸犬
*/
