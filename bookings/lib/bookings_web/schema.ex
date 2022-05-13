defmodule GraphqlTutorialWeb.Schema do
  require Logger

  use Absinthe.Schema
  use Absinthe.Federation.Schema

  alias GraphqlTutorialWeb.Schema

  object :booking do
    field(:id, non_null(:string))
  end

  object :user do
    key_fields("id")
    extends()

    field :id, non_null(:string) do
      external()
    end

    field :bookings, list_of(:booking) do
      resolve(fn arg1, _args2 ->
        Logger.info(arg1)
        {:ok, [%{id: "1"}, %{id: "2"}]}
      end)
    end
  end

  query do
    field(:booking, :booking)
  end
end
