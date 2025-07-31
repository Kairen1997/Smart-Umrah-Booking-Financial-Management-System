defmodule UmrahBooking.Admin do
  @moduledoc """
  The Admin context.
  """

  import Ecto.Query, warn: false
  alias UmrahBooking.Repo

  alias UmrahBooking.Admin.Log

  @doc """
  Returns the list of admin_logs.

  ## Examples

      iex> list_admin_logs()
      [%Log{}, ...]

  """
  def list_admin_logs do
    raise "TODO"
  end

  @doc """
  Gets a single log.

  Raises if the Log does not exist.

  ## Examples

      iex> get_log!(123)
      %Log{}

  """
  def get_log!(id), do: raise "TODO"

  @doc """
  Creates a log.

  ## Examples

      iex> create_log(%{field: value})
      {:ok, %Log{}}

      iex> create_log(%{field: bad_value})
      {:error, ...}

  """
  def create_log(attrs \\ %{}) do
    raise "TODO"
  end

  @doc """
  Updates a log.

  ## Examples

      iex> update_log(log, %{field: new_value})
      {:ok, %Log{}}

      iex> update_log(log, %{field: bad_value})
      {:error, ...}

  """
  def update_log(%Log{} = log, attrs) do
    raise "TODO"
  end

  @doc """
  Deletes a Log.

  ## Examples

      iex> delete_log(log)
      {:ok, %Log{}}

      iex> delete_log(log)
      {:error, ...}

  """
  def delete_log(%Log{} = log) do
    raise "TODO"
  end

  @doc """
  Returns a data structure for tracking log changes.

  ## Examples

      iex> change_log(log)
      %Todo{...}

  """
  def change_log(%Log{} = log, _attrs \\ %{}) do
    raise "TODO"
  end

  alias UmrahBooking.Admin.Setting

  @doc """
  Returns the list of admin_settings.

  ## Examples

      iex> list_admin_settings()
      [%Setting{}, ...]

  """
  def list_admin_settings do
    raise "TODO"
  end

  @doc """
  Gets a single setting.

  Raises if the Setting does not exist.

  ## Examples

      iex> get_setting!(123)
      %Setting{}

  """
  def get_setting!(id), do: raise "TODO"

  @doc """
  Creates a setting.

  ## Examples

      iex> create_setting(%{field: value})
      {:ok, %Setting{}}

      iex> create_setting(%{field: bad_value})
      {:error, ...}

  """
  def create_setting(attrs \\ %{}) do
    raise "TODO"
  end

  @doc """
  Updates a setting.

  ## Examples

      iex> update_setting(setting, %{field: new_value})
      {:ok, %Setting{}}

      iex> update_setting(setting, %{field: bad_value})
      {:error, ...}

  """
  def update_setting(%Setting{} = setting, attrs) do
    raise "TODO"
  end

  @doc """
  Deletes a Setting.

  ## Examples

      iex> delete_setting(setting)
      {:ok, %Setting{}}

      iex> delete_setting(setting)
      {:error, ...}

  """
  def delete_setting(%Setting{} = setting) do
    raise "TODO"
  end

  @doc """
  Returns a data structure for tracking setting changes.

  ## Examples

      iex> change_setting(setting)
      %Todo{...}

  """
  def change_setting(%Setting{} = setting, _attrs \\ %{}) do
    raise "TODO"
  end
end
