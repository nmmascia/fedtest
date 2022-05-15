defmodule BookingsWeb.Schema do
  require Logger
  require IEx

  import Ecto.Query, warn: false

  use Absinthe.Schema
  use Absinthe.Federation.Schema

  object :booking do
    field(:id, non_null(:id))

    field(:user_id, non_null(:id)) do
      external()
    end

    field(:notes, :string)
  end

  object :user do
    key_fields("id")
    extends()

    field :id, non_null(:id) do
      external()
    end

    field(:bookings, list_of(:booking)) do
      resolve(fn args, _args, _ctx ->
        {:ok, Ecto.Query.from(Bookings.Booking)
        |> where(user_id: ^args.id)
        |> Bookings.Repo.all()}
      end)
    end
  end

  query do
    extends()
  end
end
