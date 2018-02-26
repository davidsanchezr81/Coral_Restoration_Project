require_relative("../models/coral.rb")
require_relative("../models/reef.rb")
require_relative("../models/restoration.rb")
require("pry-byebug")

# Restoration.delete_all()
Coral.delete_all()
Reef.delete_all()

coral1 = Coral.new({"species" => "Acropora cervicornus", "name" => "Staghorn Coral", "plantdate" => "2012-11-14"})
coral1.save()
coral2 = Coral.new({"species" => "Montipora", "name" => "Green Montipora", "plantdate" => "2012-11-14"})
coral2.save()
coral3 = Coral.new({"species" => "Euphyllia", "name" => "Blue Hammer Head", "plantdate" => "2012-11-14"})
coral3.save()
coral4 = Coral.new({"species" => "Sarconphyton", "name" => "Todstool", "plantdate" => "2012-11-14"})
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
