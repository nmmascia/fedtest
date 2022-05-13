defmodule GraphqlTutorialWeb.Schema do
  use Absinthe.Schema
  use Absinthe.Federation.Schema

  alias GraphqlTutorialWeb.Schema

  object :booking do
    field :id, non_null(:string) do
      resolve(fn _parent, _args, _resolution ->
        "1"
      end)
    end
  end

  query do
    field(:booking, :booking)
  end
end
