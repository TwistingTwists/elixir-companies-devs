defmodule CompaniesRegEx.Repo do
  use AshPostgres.Repo, otp_app: :companies_reg_ex

  # Installs Postgres extensions that ash commonly uses
  def installed_extensions do
    ["uuid-ossp", "citext"]
  end
end
