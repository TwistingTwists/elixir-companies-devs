defmodule CompaniesRegEx.Resources do
  use Ash.Api

  resources do
    registry CompaniesRegEx.Resources.Registry
  end
end
