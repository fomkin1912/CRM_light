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
    koj = User.create(name: "Ivan", mid_name: "Sergeevich", last_name: "Kojemiako", email: "2@2", password: "123123", admin: true, enabled: true, department_id: admin_dept.id, position_id: sec.id)
    ivanov = User.create(name: "Alexander", mid_name: "Ivanovich", last_name: "Ivanov", email: "3@3", password: "123123", admin: false, enabled: true, department_id: exec_dept.id, position_id: boss.id)

    Group.create(name: "First group", created_by: admin.id)
	  Group.create(name: "Second group", created_by: admin.id)
	  Group.create(name: "Third group", created_by: admin.id)

    others_type = CompanyType.create(title: "Others")
    bank_type = CompanyType.create(title: "Banks")
    CompanyType.create(title: "Autodilers")

    company = others_type.companies.create(title: "RP, inc", full_title: "Robust programmers. inc")
    others_type.companies.create(title: "CC-best", full_title: "Civil construction best, JSC")
    bank_type.companies.create(title: "BBBF-bank", full_title: "Best bank for better future, JSC")

    petrov = Contact.create(first_name: "Иван", mid_name: "Сергеевич", last_name: "Петров",
                   email: "123@sf.com", alt_email: "wewt@sfjlj.ru", phone: "2134-234-234",
                   mobile: "230023-3990", skype: "124-lfjl32", user_id: admin.id, company_id: company.id)
    jarikov = Contact.create(first_name: "Александр", mid_name: "Эдмундович", last_name: "Жарикоd",
                   email: "123@sf.com", alt_email: "wewt@sfjlj.ru", phone: "2134-234-234",
                   mobile: "230023-3990", skype: "124-lfjl32", user_id: admin.id, company_id: company.id)
    rezakov = Contact.create(first_name: "Автандил", mid_name: "Тимофеевич", last_name: "Резаков",
                   email: "123@sf.com", alt_email: "wewt@sfjlj.ru", phone: "2134-234-234",
                   mobile: "230023-3990", skype: "124-lfjl32", user_id: admin.id)

    meet_up = ActivityType.create(title: "Meet up")
    phone_call = ActivityType.create(title: "Phone call")
    send_email = ActivityType.create(title: "Send email")

    pending_activity = Activity.create(user_id: admin.id, contact_id: petrov.id, activity_type_id: send_email.id,
     subject: "send email to Petrov. Urgent!", date_planned: "2016-12-19")
    completed_activity = Activity.create(user_id: ivanov.id, contact_id: jarikov.id, activity_type_id: meet_up.id,
     subject: "meet Jarikov. Not urgent!", date_planned: "2016-10-19", date: "2016-12-19")
    in_process_activity = Activity.create(user_id: koj.id, contact_id: rezakov.id, activity_type_id: phone_call.id,
     subject: "call Rezakov. Not urgent!", info: "Call made. Everything OK", date_planned: "2016-10-19")
    Activity.create(user_id: koj.id, contact_id: rezakov.id, activity_type_id: phone_call.id, subject: "call Rezakov. Not urgent!",
                    info: "Call made. Everything OK", date_planned: "2015-10-19")
    Activity.create(user_id: koj.id, contact_id: rezakov.id, activity_type_id: meet_up.id, subject: "meet Rezakov. Not urgent!",
                    info: "Call made. Everything OK", date_planned: "2016-10-19", date: "2016-10-25")
    Activity.create(user_id: koj.id, contact_id: rezakov.id, activity_type_id: send_email.id, subject: "mail Rezakov. Not urgent!",
                    info: "", date_planned: "2016-10-19")
    Activity.create(user_id: koj.id, contact_id: petrov.id, activity_type_id: phone_call.id, subject: "call Petrov. Not urgent!",
                    info: "Call made. Everything OK", date_planned: "2015-08-09", date: "2016-09-12")
    Activity.create(user_id: koj.id, contact_id: petrov.id, activity_type_id: meet_up.id, subject: "meet Petrov. Very very urgent. Not urgent!",
                    info: "Meet_up made. Everything OK", date_planned: "2014-05-01", date: "2015-03-20")
    Activity.create(user_id: koj.id, contact_id: petrov.id, activity_type_id: send_email.id, subject: "email Petrov. Not urgent!",
                   info: "Call made. Everything OK", date_planned: "2016-06-30")
    Activity.create(user_id: koj.id, contact_id: jarikov.id, activity_type_id: phone_call.id, subject: "call Jarickov. Not urgent!",
                   info: "Call made. Everything OK", date_planned: "2016-10-01", date: "2016-10-15")
    Activity.create(user_id: koj.id, contact_id: jarikov.id, activity_type_id: meet_up.id, subject: "meets up with Jarikov. Very urgent!",
                   info: "Call made. Everything OK", date_planned: "2016-09-05")
    Activity.create(user_id: ivanov.id, contact_id: rezakov.id, activity_type_id: phone_call.id, subject: "call Rezakov. Not urgent!",
                   info: "Call made. Everything OK", date_planned: "2016-10-19")
    Activity.create(user_id: ivanov.id, contact_id: rezakov.id, activity_type_id: phone_call.id, subject: "call Rezakov. Not urgent!",
                   info: "Call made. Everything OK", date_planned: "2016-10-19")
    Activity.create(user_id: admin.id, contact_id: rezakov.id, activity_type_id: phone_call.id, subject: "call Rezakov. Not urgent!",
                   info: "Call made. Everything OK", date_planned: "2016-10-19")
    
