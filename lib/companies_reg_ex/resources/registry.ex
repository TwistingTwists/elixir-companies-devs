defmodule CompaniesRegEx.Resources.Registry do
  use Ash.Registry,
    extensions: [
      Ash.Registry.ResourceValidations
    ]

  entries do
    entry CompaniesRegEx.Resources.Recruiters
  end
end
