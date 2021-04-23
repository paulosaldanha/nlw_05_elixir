defmodule InmanaWeb.SuppliesViewTest do
  use InmanaWeb.ConnCase

  import Phoenix.View

  alias Inmana.Supply
  alias InmanaWeb.SuppliesView

  describe "render/2" do
    test "renders create.json" do
      params = %{"description" => "Molho de tomate", "expiration_date" => "2021-04-23", "responsible" => "Jose", "restaurant_id" => "b616c5fa-7046-4ae4-8889-3b8e39a43eeb"}
      {:ok, supply} = Inmana.create_supply(params)

      response = render(SuppliesView, "create.json", supply: supply)

      assert %{
        message: "Supply created",
        supply: %Supply{
          description: "Molho de tomate",
          expiration_date: ~D[2021-04-23],
          id: _id,
          responsible: "Jose",
          restaurant_id: "b616c5fa-7046-4ae4-8889-3b8e39a43eeb",
        }
      } = response
    end
  end

  describe "show/1" do
    test "show specific supply by" do
      params = "5947ad50-db8e-4a04-9e17-9f4cf984f978"
      {:ok, supply} = Inmana.get_supply(params)


      response = render(SuppliesView, "show.json", supply: supply)

      assert %{supply: %{id: "5947ad50-db8e-4a04-9e17-9f4cf984f978"}}
      = response
    end
  end
end
