defmodule UmrahBooking.AccountsTest do
  use UmrahBooking.DataCase

  alias UmrahBooking.Accounts

  describe "users" do
    alias UmrahBooking.Accounts.User

    import UmrahBooking.AccountsFixtures

    @invalid_attrs %{}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{}

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{}

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "users_profile" do
    alias UmrahBooking.Accounts.UserProfile

    import UmrahBooking.AccountsFixtures

    @invalid_attrs %{}

    test "list_users_profile/0 returns all users_profile" do
      user_profile = user_profile_fixture()
      assert Accounts.list_users_profile() == [user_profile]
    end

    test "get_user_profile!/1 returns the user_profile with given id" do
      user_profile = user_profile_fixture()
      assert Accounts.get_user_profile!(user_profile.id) == user_profile
    end

    test "create_user_profile/1 with valid data creates a user_profile" do
      valid_attrs = %{}

      assert {:ok, %UserProfile{} = user_profile} = Accounts.create_user_profile(valid_attrs)
    end

    test "create_user_profile/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user_profile(@invalid_attrs)
    end

    test "update_user_profile/2 with valid data updates the user_profile" do
      user_profile = user_profile_fixture()
      update_attrs = %{}

      assert {:ok, %UserProfile{} = user_profile} = Accounts.update_user_profile(user_profile, update_attrs)
    end

    test "update_user_profile/2 with invalid data returns error changeset" do
      user_profile = user_profile_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user_profile(user_profile, @invalid_attrs)
      assert user_profile == Accounts.get_user_profile!(user_profile.id)
    end

    test "delete_user_profile/1 deletes the user_profile" do
      user_profile = user_profile_fixture()
      assert {:ok, %UserProfile{}} = Accounts.delete_user_profile(user_profile)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user_profile!(user_profile.id) end
    end

    test "change_user_profile/1 returns a user_profile changeset" do
      user_profile = user_profile_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user_profile(user_profile)
    end
  end
end
