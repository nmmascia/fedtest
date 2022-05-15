defmodule Bookings.Repo.Migrations.CreateBookings do
  use Ecto.Migration

  def change do
    create table(:bookings) do
      add :user_id, :string
      add :notes, :string

      timestamps()
    end

    create unique_index(:bookings, [:user_id])
  end
end
