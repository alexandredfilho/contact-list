user = User.create!(
      email: "teste@teste.com",
      password: "12345678"
    )

user.photo.attach(
  io: File.open('app/assets/images/avatar.jpg'),
  filename: 'avatar.jpg'
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

employees = Employee.create([
  {
    roles: "manager",
    department_id: 1,
    date_of_birth: '1991-05-17',
    first_name: "Alexandre",
    last_name: "Domingos",
    company: "Alex Inc.",
    title: "Ruby on Rails Developer",
    email: "alex@test.com",
    phone: "123456789"
  },
  {
    roles: "employee",
    department_id: 2,
    date_of_birth: '1994-09-27',
    first_name: "John",
    last_name: "Doe",
    company: "JD Corp.",
    title: "React Js Developer",
    email: "john.doe@jdcorp.com",
    phone: "87654321"
  },
  {
    roles: "employee",
    department_id: 1,
    date_of_birth: '2003-07-27',
    first_name: "Stwart",
    last_name: "Minion",
    company: "Minons Inc.",
    title: "CIO",
    email: "stwart@minions.com",
    phone: "12345689"
  }
])

employees.each do |i|
  i.photo.attach(
    io: File.open('app/assets/images/avatar.jpg'),
    filename: 'avatar.jpg'
  )
end
