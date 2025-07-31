defmodule UmrahBooking.AdminTest do
  use UmrahBooking.DataCase

  alias UmrahBooking.Admin

  describe "admin_logs" do
    alias UmrahBooking.Admin.Log

    import UmrahBooking.AdminFixtures

    @invalid_attrs %{}

    test "list_admin_logs/0 returns all admin_logs" do
      log = log_fixture()
      assert Admin.list_admin_logs() == [log]
    end

    test "get_log!/1 returns the log with given id" do
      log = log_fixture()
      assert Admin.get_log!(log.id) == log
    end

    test "create_log/1 with valid data creates a log" do
      valid_attrs = %{}

      assert {:ok, %Log{} = log} = Admin.create_log(valid_attrs)
    end

    test "create_log/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admin.create_log(@invalid_attrs)
    end

    test "update_log/2 with valid data updates the log" do
      log = log_fixture()
      update_attrs = %{}

      assert {:ok, %Log{} = log} = Admin.update_log(log, update_attrs)
    end

    test "update_log/2 with invalid data returns error changeset" do
      log = log_fixture()
      assert {:error, %Ecto.Changeset{}} = Admin.update_log(log, @invalid_attrs)
      assert log == Admin.get_log!(log.id)
    end

    test "delete_log/1 deletes the log" do
      log = log_fixture()
      assert {:ok, %Log{}} = Admin.delete_log(log)
      assert_raise Ecto.NoResultsError, fn -> Admin.get_log!(log.id) end
    end

    test "change_log/1 returns a log changeset" do
      log = log_fixture()
      assert %Ecto.Changeset{} = Admin.change_log(log)
    end
  end

  describe "admin_settings" do
    alias UmrahBooking.Admin.Setting

    import UmrahBooking.AdminFixtures

    @invalid_attrs %{}

    test "list_admin_settings/0 returns all admin_settings" do
      setting = setting_fixture()
      assert Admin.list_admin_settings() == [setting]
    end

    test "get_setting!/1 returns the setting with given id" do
      setting = setting_fixture()
      assert Admin.get_setting!(setting.id) == setting
    end

    test "create_setting/1 with valid data creates a setting" do
      valid_attrs = %{}

      assert {:ok, %Setting{} = setting} = Admin.create_setting(valid_attrs)
    end

    test "create_setting/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admin.create_setting(@invalid_attrs)
    end

    test "update_setting/2 with valid data updates the setting" do
      setting = setting_fixture()
      update_attrs = %{}

      assert {:ok, %Setting{} = setting} = Admin.update_setting(setting, update_attrs)
    end

    test "update_setting/2 with invalid data returns error changeset" do
      setting = setting_fixture()
      assert {:error, %Ecto.Changeset{}} = Admin.update_setting(setting, @invalid_attrs)
      assert setting == Admin.get_setting!(setting.id)
    end

    test "delete_setting/1 deletes the setting" do
      setting = setting_fixture()
      assert {:ok, %Setting{}} = Admin.delete_setting(setting)
      assert_raise Ecto.NoResultsError, fn -> Admin.get_setting!(setting.id) end
    end

    test "change_setting/1 returns a setting changeset" do
      setting = setting_fixture()
      assert %Ecto.Changeset{} = Admin.change_setting(setting)
    end
  end
end
