# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Bookings.Repo.insert!(%Bookings.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
Bookings.Repo.insert!(%Bookings.Booking{
  user_id: "1",
  notes: "A really nice place"
})
