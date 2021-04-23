defmodule InmanaWeb.SuppliesControllerTest do
  use InmanaWeb.ConnCase

  describe "create/2" do
    test "when all params are valid, creates the supply", %{conn: conn} do
      params = %{"description" => "Molho de tomate", "expiration_date" => "2021-04-23", "responsible" => "Jose", "restaurant_id" => "b616c5fa-7046-4ae4-8889-3b8e39a43eeb"}
      response =
        conn
        |> post(Routes.supplies_path(conn, :create, params))
        |> json_response(:created)

      assert %{
        "message" => "Supply created",
        "supply" => %{
          "description" => "Molho de tomate",
          "expiration_date" => "2021-04-23",
          "id" => _id,
          "responsible" => "Jose",
          "restaurant_id" => "b616c5fa-7046-4ae4-8889-3b8e39a43eeb"

        }
      } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{"description" => "Molho de tomate", "expiration_date" => "2021-04-23", "responsible" => "Jo", "restaurant_id" => "b616c5fa-7046-4ae4-8889-3b8e39a43eeb"}
      expected_response =  %{"message" => %{"responsible" => ["should be at least 3 character(s)"]}}

      response =
        conn
        |> post(Routes.supplies_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end

  describe "show/1" do
    test "when call get by id and all is correct", %{conn: conn} do
      params = "5947ad50-db8e-4a04-9e17-9f4cf984f978"

      response =
        conn
        |> get(Routes.supplies_path(conn, :show, params))
        |> json_response(:ok)

      assert %{"supply" => %{"description" => "Molho bisque", "expiration_date" => "2021-04-28", "id" => _id, "responsible" => "Zezao", "restaurant_id" => "b616c5fa-7046-4ae4-8889-3b8e39a43eeb"}} = response

    end

    test "when call get by id with an invalid/non existent one", %{conn: conn} do
      params = "5947ad50-db8e-4a04-9e17-9f4cf984f979"

      response =
        conn
        |> get(Routes.supplies_path(conn, :show, params))
        |> json_response(:not_found)

      assert  %{"message" => "Supply not found"}
      = response

    end
  end

end
