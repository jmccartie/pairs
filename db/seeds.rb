WoStatus.create(:status => "Processing", :style => "warning")
WoStatus.create(:status => "Working", :style => "info")
WoStatus.create(:status => "Completed", :style => "success")
WoStatus.create(:status => "Error", :style => "error")
WoStatus.create(:status => "New", :style => "new")

# Zones
(1..10).each do |n|
  Zone.create(zone: n)
end
Zone.create(zone: "A")