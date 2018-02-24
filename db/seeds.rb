require_relative("../models/coral.rb")
require_relative("../models/reef.rb")
require("pry-byebug")

Coral.delete_all()
Reef.delete_all()

coral1 = Coral.new({"species" => "Acropora cervicornus", "name" => "Staghorn Coral"})
coral1.save()
coral2 = Coral.new({"species" => "Montipora", "name" => "Green Montipora"})
coral2.save()
coral3 = Coral.new({"species" => "Euphyllia", "name" => "Blue Hammer Head"})
coral3.save()
coral4 = Coral.new({"species" => "Sarconphyton", "name" => "Todstool"})
coral4.save()


reef1 = Reef.new({"name" => "Ningaloo", "location" => "Australia"})
reef1.save()
reef2 = Reef.new({"name" => "Koh Ma", "location" => "Thailand"})
reef2.save()
reef3 = Reef.new({"name" => "Tubbataha", "location" => "Indonesia"})
reef3.save()
reef4 = Reef.new({"name" => "Molasses", "location" => "USA - Florida"})
reef4.save()



binding.pry
nil
