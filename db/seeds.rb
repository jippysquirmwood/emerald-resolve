User.destroy_all
Project.destroy_all
Org.destroy_all
OrgProject.destroy_all

users_attributes = [
  {
    first_name: "jonathan",
    last_name: "reid",
    username: "jippy",
    email: "jonathan.reid@laminar.com",
    password: "123123"
  },
  {
    first_name: "david",
    last_name: "nash",
    username: "nashie",
    email: "david.nash@laminar.com",
    password: "123123"
  }
]

puts "creating nashie and jono"
User.create!(users_attributes)
puts "those two duds created"

puts "---------------------------------"
puts "---------------------------------"

projects_attributes = [
  {
    name: "Northern Line Extension",
    body: {
      country: "UK",
      value: 300000000,
      sites: [
        {
          name: "BTS",
          levels: [
            "B4",
            "B3",
            "B2",
            "B1",
            "TH",
            "L01"
          ]
        },
        {
          name: "NES",
          levels: [
            "B5",
            "B4",
            "B3",
            "B2",
            "B1",
            "TH",
            "TH-MEZZ"
          ]
        }
      ]
    }
  },
  {
    name: "London Bridge Station Redevelopment",
    body: { country: "UK", value: 1000000000 }
  },
  {
    name: "STIP - Holloway Road Bridge Replacement",
    body: { country: "UK", value: 20000000 }
  },
  {
    name: "Jilalan Railyard Upgrade",
    body: { country: "AUS", value: 500000000 }
  }
]

puts "creating 4 of jono's projects"
Project.create!(projects_attributes)
puts "those 4 fantastic projects done"

puts "---------------------------------"
puts "---------------------------------"


orgs_attributes = [
  {
    name: "emerald",
    body: {
      value: 100000000000
    }
  },
  {
    name: "laminar",
    body: {
      people: User.where("email LIKE ?", "%laminar.com").all
    }
  },
  {
    name: "FLO",
    body: {
      jv_partners: ["Ferrovial", "Laing O'Rourke"]
    }
  },
  {
    name: "Emico",
    body: {
      specialties: ["Mechanical", "Electrical", "Public Health"]
    }
  },
  {
    name: "macmahon",
    body: {
      status: "defunct",
      exists: false
    }
  }
]



puts "creating 5 of jono's orgs"
Org.create!(orgs_attributes)
puts "those 5 fantastic companies (orgs) done"

puts "---------------------------------"
puts "---------------------------------"


# org_projects_attributes = [
#   {
#     project_id: Project.first.id,
#     org_id: Org.first.id
#   }
# ]

puts "creating these org_projects"
OrgProject.create!(  {
    project_id: Project.where(name: "Jilalan Railyard Upgrade")[0].id,
    org_id: Org.where(name: "macmahon")[0].id
  })
puts "those ventures are complete"

puts "---------------------------------"
puts "---------------------------------"















