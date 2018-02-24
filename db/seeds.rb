require_relative("../models/coral.rb")
require_relative("../models/reef.rb")
require_relative("../models/restoration.rb")
require("pry-byebug")

Restoration.delete_all()
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


restoration1 = Restoration.new({"coral_id" => coral1.id, "reef_id" => reef1.id})
restoration1.save()
restoration2 = Restoration.new({"coral_id" => coral2.id, "reef_id" => reef2.id})
restoration2.save()
restoration3 = Restoration.new({"coral_id" => coral3.id, "reef_id" => reef3.id})
restoration3.save()
restoration4 = Restoration.new({"coral_id" => coral4.id, "reef_id" => reef4.id})
restoration4.save()



binding.pry
nil
