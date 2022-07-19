# p 'create user aa@bb.com qwertz12 ...'

# User.create!(email: 'aa@bb.com', password: 'qwertz12', role: 2)
# User.create!(email: 'test@bb.com', password: 'qwertz12', role: 0)

# p 'create stations'

# Station.create!(
#   name: 'Bhf Fischbachau',
#   longitude: 47.705869,
#   latitude: 11.933774
# )
# Station.create!(
#   name: 'Bhf Gmund (Tegernsee)',
#   longitude: 47.749597,
#   latitude: 11.734603
# )
# Station.create!(
#   name: 'Bhf Lenggries',
#   longitude: 47.679590,
#   latitude: 11.573928
# )
# Station.create!(
#   name: 'Bhf Kochel',
#   longitude: 47.660331,
#   latitude: 11.370752
# )
# Station.create!(
#   name: 'Bhf Klais',
#   longitude: 47.482959,
#   latitude: 11.237969,
# )
# Station.create!(
#   name: 'Bhf Eschenlohe',
#   longitude: 47.602233,
#   latitude: 11.188538
# )
# Station.create!(
#   name: 'Bhf Lermoos',
#   longitude: 47.405286,
#   latitude: 10.878783
# )
# Station.create!(
#   name: 'Vorderriss',
#   longitude: 47.559344,
#   latitude: 11.436177
# )

# p 'create station schedules for Kochel'

# StationSchedule.create!(
#   station: Station.where(name: 'Bhf Kochel').first,
#   start_date: Date.new(2022, 7, 1),
#   end_date: Date.new(2022, 8, 25)
# )

# p 'create bikes'

# bike_categories = %w[mountain trekking eBike MTB]
# size = %w[S M L XL]
# state = %w[excellent good need_repair urgent_repair]
# price_per_day = [15, 30]

# 25.times do
#   Bike.create!(
#     category: 'mountain',
#     weight: rand(30..50),
#     size: size.sample,
#     state: state.sample,
#     price_per_day: price_per_day.sample
#   )
# end

# p 'create bookings'

# stations = Station.all

# 10.times do
#   Booking.create!(
#     user: User.first,
#     status: 'pending',
#     date: Date.new,
#     station: stations.sample,
#     total_price:
#   )
# end

# bookings = Bookings.all
# bikes = Bike.all
# selection = Bike_selection.new()
