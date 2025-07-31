defmodule UmrahBooking.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias UmrahBooking.Repo

  alias UmrahBooking.Accounts.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    raise "TODO"
  end

  @doc """
  Gets a single user.

  Raises if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

  """
  def get_user!(id), do: raise "TODO"

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, ...}

  """
  def create_user(attrs \\ %{}) do
    raise "TODO"
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, ...}

  """
  def update_user(%User{} = user, attrs) do
    raise "TODO"
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, ...}

  """
  def delete_user(%User{} = user) do
    raise "TODO"
  end

  @doc """
  Returns a data structure for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Todo{...}

  """
  def change_user(%User{} = user, _attrs \\ %{}) do
    raise "TODO"
  end

  alias UmrahBooking.Accounts.UserProfile

  @doc """
  Returns the list of users_profile.

  ## Examples

      iex> list_users_profile()
      [%UserProfile{}, ...]

  """
  def list_users_profile do
    raise "TODO"
  end

  @doc """
  Gets a single user_profile.

  Raises if the User profile does not exist.

  ## Examples

      iex> get_user_profile!(123)
      %UserProfile{}

  """
  def get_user_profile!(id), do: raise "TODO"

  @doc """
  Creates a user_profile.

  ## Examples

      iex> create_user_profile(%{field: value})
      {:ok, %UserProfile{}}

      iex> create_user_profile(%{field: bad_value})
      {:error, ...}

  """
  def create_user_profile(attrs \\ %{}) do
    raise "TODO"
  end

  @doc """
  Updates a user_profile.

  ## Examples

      iex> update_user_profile(user_profile, %{field: new_value})
      {:ok, %UserProfile{}}

      iex> update_user_profile(user_profile, %{field: bad_value})
      {:error, ...}

  """
  def update_user_profile(%UserProfile{} = user_profile, attrs) do
    raise "TODO"
  end

  @doc """
  Deletes a UserProfile.

  ## Examples

      iex> delete_user_profile(user_profile)
      {:ok, %UserProfile{}}

      iex> delete_user_profile(user_profile)
      {:error, ...}

  """
  def delete_user_profile(%UserProfile{} = user_profile) do
    raise "TODO"
  end

  @doc """
  Returns a data structure for tracking user_profile changes.

  ## Examples

      iex> change_user_profile(user_profile)
      %Todo{...}

  """
  def change_user_profile(%UserProfile{} = user_profile, _attrs \\ %{}) do
    raise "TODO"
  end
end
