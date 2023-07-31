defmodule CompaniesRegEx.Resources.Registry do
  use Ash.Registry,
    extensions: [
      Ash.Registry.ResourceValidations
    ]

  entries do
    entry CompaniesRegEx.Resources.Recruiters
    entry CompaniesRegEx.Resources.Developer
    entry CompaniesRegEx.Resources.JobDescription
  end
end
