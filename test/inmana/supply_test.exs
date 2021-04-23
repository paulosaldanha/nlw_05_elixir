defmodule Inmana.SupplyTest do
  use Inmana.DataCase

  alias Ecto.Changeset
  alias Inmana.Supply

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{"description" => "Molho de tomate", "expiration_date" => "2021-04-23", "responsible" => "Jose", "restaurant_id" => "b616c5fa-7046-4ae4-8889-3b8e39a43eeb"}

      response = Supply.changeset(params)

      assert %Changeset{changes: %{description: "Molho de tomate", expiration_date: _expiration_date, responsible: "Jose"}, valid?: true} = response
    end

    test "when there are invalid params, returns an invalid changeset" do
      params = %{"description" => "Molho de tomate", "responsible" => "Jose"}
      expected_response =  %{expiration_date: ["can't be blank"], restaurant_id: ["can't be blank"]}

      response = Supply.changeset(params)

      assert %Changeset{valid?: false} = response

      assert errors_on(response) == expected_response
    end
  end
end
