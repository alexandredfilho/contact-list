User.create!(
    email: "teste@teste.com",
    password: "12345678"
  )

Floor.create!([
  {
    description: "1º Floor"
  },
  {
    description: "2º Floor"
  }
  ])

Department.create!([
  {
    description: "IT",
    floor_id: 1
  },
  {
    description: "Financial",
    floor_id: 2
  }
])

Employee.create!([
  {
    first_name: "Alexandre",
    last_name: "Domingos",
    company: "Alex Inc.",
    email: "alex@test.com",
    phone: "12345678",
    department_id: 1,
  },
  {
    first_name: "Joãozin",
    last_name: "Da Silva",
    company: "XPTO Inc.",
    email: "joanzin@test.com",
    phone: "87654321",
    department_id: 2,
  }
])
