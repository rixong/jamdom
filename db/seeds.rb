
Space.create(name: "Joes Garage")
Space.create(name: "Antones")
Space.create(name: "Continental Club")

Instrument.create(name: "Guitar")
Instrument.create(name: "Drums")
Instrument.create(name: "Piano")
Instrument.create(name: "Keyboard")
Instrument.create(name: "Violin")
Instrument.create(name: "Cello")


Genre.create(name: "Rock")
Genre.create(name: "Jazz")
Genre.create(name: "Blues")
Genre.create(name: "Country")
Genre.create(name: "Soul")
Genre.create(name: "Rap")
Genre.create(name: "Classical")
Genre.create(name: "Oldies")

User.create(name: "Rick Glascock", email: "rixong@gmail.com", phone: "512-466-4190", bio: "I love RHCP and Strvainsky.",video: "https://www.youtube.com/embed/WmjQIHF2dAQ", password: "password")
User.create(name: "Nora Jones", email: "nora@aol.com", phone: "512-466-4190", bio: "I grew up singing in the church.", video: "https://www.youtube.com/embed/fd02pGJx0s0", password: "password")

UserInstrument.create(user_id: 1, instrument_id: 1)
UserInstrument.create(user_id: 1, instrument_id: 2)
UserInstrument.create(user_id: 2, instrument_id: 2)
UserInstrument.create(user_id: 2, instrument_id: 3)

GenreUser.create(genre_id: 1, user_id: 1)
GenreUser.create(genre_id: 2, user_id: 1)
GenreUser.create(genre_id: 2, user_id: 2)
GenreUser.create(genre_id: 3, user_id: 2)
