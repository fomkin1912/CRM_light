# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
    admin_dept = Department.create(title: "Administrative")
    exec_dept = Department.create(title: "Executive")

    sec = Position.create(title: "Secretary")
    boss = Position.create(title: "Boss")

		admin = User.create(name: "Admin user", email: "1@1", last_name: "Pupkin", password: "123123", admin: true, enabled: true)
    User.create(name: "Ivan", mid_name: "Sergeevich", last_name: "Kojemiako", email: "2@2", password: "123123", admin: false, enabled: true, department_id: admin_dept.id, position_id: sec.id)
    User.create(name: "Alexander", mid_name: "Ivanovich", last_name: "Ivanov", email: "3@3", password: "123123", admin: false, enabled: true, department_id: exec_dept.id, position_id: boss.id)

    Group.create(name: "First group", created_by: admin.id)
		Group.create(name: "Second group", created_by: admin.id)
		Group.create(name: "Third group", created_by: admin.id)


		others_type = CompanyType.create(title: "Others")
		bank_type = CompanyType.create(title: "Banks")
		CompanyType.create(title: "Autodilers")

		others_type.companies.create(title: "RP, inc", full_title: "Robust programmers. inc")
    others_type.companies.create(title: "CC-best", full_title: "Civil construction best, JSC")
    bank_type.companies.create(title: "BBBF-bank", full_title: "Best bank for better future, JSC")

    admin_dept = Department.create(title: "Administrative")
    exec_dept = Department.create(title: "Executive")



		
		
