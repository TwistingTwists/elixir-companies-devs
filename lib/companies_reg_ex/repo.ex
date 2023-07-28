defmodule CompaniesRegEx.Repo do
  use Ecto.Repo,
    otp_app: :companies_reg_ex,
    adapter: Ecto.Adapters.Postgres
end
