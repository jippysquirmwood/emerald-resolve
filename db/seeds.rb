User.destroy_all
Project.destroy_all
Org.destroy_all
OrgProject.destroy_all
Event.destroy_all

users_attributes = [
  {
    first_name: "jonathan",
    last_name: "reid",
    username: "jippy",
    email: "jonathan.reid@emerald.com",
    password: "123123"
  },
  {
    first_name: "david",
    last_name: "nash",
    username: "nashie",
    email: "david.nash@laminar.com",
    password: "123123"
  },
  {
    first_name: "mathew",
    last_name: "briggs",
    username: "atsuto",
    email: "mathew.briggs@laminar.com",
    password: "123123"
  },
  {
    first_name: "nigel",
    last_name: "jamison",
    username: "nigel",
    email: "nigel.jamison@emico.co",
    password: "123123"
  },
  {
    first_name: "paul",
    last_name: "chapman",
    username: "pchapman",
    email: "paul.chapman@emico.co",
    password: "123123"
  },
  {
    first_name: "franco",
    last_name: "manco",
    username: "franco_manco",
    email: "franco.manco@flo.com",
    password: "123123"
  },
  {
    first_name: "tralpy",
    last_name: "mcpiney",
    username: "tralpy",
    email: "tralpy.mcpiney@tfl.com",
    password: "123123"
  }
]

puts "creating users"
User.create!(users_attributes)
puts "those users created"

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
      specialties: ["Mechanical", "Electrical", "Public Health"],
      people: User.where("email LIKE ?", "%emico.co").all
    }
  },
  {
    name: "macmahon",
    body: {
      status: "defunct",
      exists: false
    }
  },
  {
    name: "Hochtief",
    body: {
      head_office: "Germany"
    }
  },
  {
    name: "TfL",
    body: {
      client: true
    }
  },
  {
    name: "Network Rail",
    body: {
      client: true
    }
  }
]



puts "creating 5 of jono's orgs"
Org.create!(orgs_attributes)
puts "those 5 fantastic companies (orgs) done"

puts "---------------------------------"
puts "---------------------------------"


org_projects_attributes = [
  {
    project_id: Project.where(name: "Jilalan Railyard Upgrade")[0].id,
    org_id: Org.where(name: "macmahon")[0].id
  },
  {
    project_id: Project.where(name: "London Bridge Station Redevelopment")[0].id,
    org_id: Org.where(name: "laminar")[0].id
  },
  {
    project_id: Project.where(name: "London Bridge Station Redevelopment")[0].id,
    org_id: Org.where(name: "emerald")[0].id
  },
  {
    project_id: Project.where(name: "Northern Line Extension")[0].id,
    org_id: Org.where(name: "Emico")[0].id
  },
  {
    project_id: Project.where(name: "Northern Line Extension")[0].id,
    org_id: Org.where(name: "FLO")[0].id
  },
  {
    project_id: Project.where(name: "STIP - Holloway Road Bridge Replacement")[0].id,
    org_id: Org.where(name: "Hochtief")[0].id
  },
  {
    project_id: Project.where(name: "STIP - Holloway Road Bridge Replacement")[0].id,
    org_id: Org.where(name: "TfL")[0].id
  }
]

puts "creating these org_projects"
OrgProject.create!(org_projects_attributes)
puts "those ventures are complete"

puts "---------------------------------"
puts "---------------------------------"

user_org_projects_attributes = [
  {
    user_id: User.where(username: "jippy")[0].id,
    org_project_id: OrgProject.all[0].id,
    start_date: Date.new(2008, 12, 1),
    end_date: Date.new(2010, 1, 31)
  },
  {
    user_id: User.where(username: "jippy")[0].id,
    org_project_id: OrgProject.all[1].id,
    start_date: Date.new(2017, 1, 25),
    end_date: Date.new(2018, 9, 30)
  },
  {
    user_id: User.where(username: "atsuto")[0].id,
    org_project_id: OrgProject.all[1].id,
    start_date: Date.new(2016, 1, 1),
    end_date: Date.new(2018, 12, 31)
  },
  {
    user_id: User.where(username: "nashie")[0].id,
    org_project_id: OrgProject.all[2].id,
    start_date: Date.new(2017, 6, 1),
    end_date: Date.new(2017, 6, 30)
  },
  {
    user_id: User.where(username: "nigel")[0].id,
    org_project_id: OrgProject.all[3].id,
    start_date: Date.new(2018, 6, 1)
  },
  {
    user_id: User.where(username: "pchapman")[0].id,
    org_project_id: OrgProject.all[3].id,
    start_date: Date.new(2018, 6, 1)
  },
  {
    user_id: User.where(username: "franco_manco")[0].id,
    org_project_id: OrgProject.all[4].id,
    start_date: Date.new(2017, 1, 1)
  },
  {
    user_id: User.where(username: "jippy")[0].id,
    org_project_id: OrgProject.all[5].id,
    start_date: Date.new(2017, 1, 1),
    end_date: Date.new(2017, 1, 22)
  },
  {
    user_id: User.where(username: "tralpy")[0].id,
    org_project_id: OrgProject.all[6].id,
    start_date: Date.new(2016, 1, 1),
    end_date: Date.new(2018, 6, 15)
  }
]

puts "creating these user_org_projects"
UserOrgProject.create!(user_org_projects_attributes)
puts "those employment scenarios are complete"

puts "---------------------------------"
puts "---------------------------------"

events_attributes = [
  {
    description: "ev1 - this thing is oh so wrong",
    author_id: UserOrgProject.first.user.id,
    body: {
      info: "site entrance"
    }
  },
  {
    description: "ev2 - what about this one?",
    author_id: UserOrgProject.last.user.id,
    body: {
      info: "fantastic job they have done here"
    }
  }
]

puts "creating these events"
Event.create!(events_attributes)
puts "those events are complete"

puts "---------------------------------"
puts "seed complete!"












