5.times do |n|
  company = Company.create({

        name: "Test Company #{n + 1}" })

          admin = User.new({
            first_name:   Faker::Name.first_name,
            last_name:    Faker::Name.last_name,
            email:        Faker::Internet.safe_email,
            department:   Faker::Commerce.department,
            admin:        true,
            company_id:   company.id
          })

            admin.password = "password"
            admin.save!

          5.times do
            user = User.new({
                    first_name:   Faker::Name.first_name,
                    last_name:    Faker::Name.last_name,
                    email:        Faker::Internet.safe_email,
                    department:   Faker::Team.state,
                    admin:        false,
                    company_id:   company.id
            })
            user.password = "password"
            user.save!

            2.times do
              site = Site.create({
                    name:       Faker::Team.name,
                    location:   Faker::Team.state,
                    company_id: company.id })

              building = Building.create({
                    name:     Faker::Team.sport,
                    street:   Faker::Address.street_name,
                    city:     Faker::Address.city,
                    state:    Faker::Address.state,
                    zip:      Faker::Address.zip,
                    site_id:  site.id })

              room = Room.create({
                    name:         Faker::Team.name,
                    capacity:     rand(50),
                    building_id:  building.id })

              5.times do
                event = Event.create({
                      start_time:   Faker::Time.forward(5, :morning),
                      duration:     rand(30..60),
                      description:  Faker::Lorem.sentence,
                      room_id:      room.id,
                      user_id:      user.id,
                      private:      false})

                Attendee.create({
                      event_id: event.id,
                      user_id: user.id
                  })
                end
              end
            end
          end
