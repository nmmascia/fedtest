defmodule Bookings.Booking do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bookings" do
    field :notes, :string
    field :user_id, :string

    timestamps()
  end

  @doc false
  def changeset(booking, attrs) do
    booking
    |> cast(attrs, [:user_id, :notes])
    |> validate_required([:user_id, :notes])
    |> unique_constraint(:user_id)
  end
end
