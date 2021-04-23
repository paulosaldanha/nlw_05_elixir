defmodule Inmana.RestaurantTest do
  use Inmana.DataCase

  alias Ecto.Changeset
  alias Inmana.Restaurant

  describe "changeset/1" do
    test "when all params are valida, returns a valid changeset" do
      params = %{"name" => "banana", "email" => "banana@gmail.com"}

      response = Restaurant.changeset(params)

      assert %Changeset{changes: %{email: "banana@gmail.com", name: "banana"}, valid?: true} = response
    end

    test "when there are invalid params, returns an invalid changeset" do
      params = %{"name" => "b", "email" => ""}
      expected_response = %{
        email: ["can't be blank"],
        name: ["should be at least 2 character(s)"]
      }

      response = Restaurant.changeset(params)

      assert %Changeset{valid?: false} = response

      assert errors_on(response) == expected_response
    end
  end
end
