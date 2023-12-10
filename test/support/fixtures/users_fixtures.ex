defmodule RpApi.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `RpApi.Users` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        bio: "some bio",
        full_name: "some full_name",
        gender: "some gender"
      })
      |> RpApi.Users.create_user()

    user
  end
end
