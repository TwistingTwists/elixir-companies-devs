defmodule CompaniesRegEx.Resources.JobDescription do
  use Ash.Resource, data_layer: AshPostgres.DataLayer

  postgres do
    table "job_description"
    repo CompaniesRegEx.Repo
  end

  code_interface do
    define_for CompaniesRegEx.Resources

    define :get_by_id, args: [:id], action: :by_id
  end

  actions do
    defaults [:create, :read, :update, :destroy]

    read :by_id do
      argument :id, :uuid, allow_nil?: false
      get? true
      filter expr(id == ^arg(:id))
    end
  end

  attributes do
    # Add an autogenerated UUID primary key called `:id`.
    uuid_primary_key :id

    # create JD as its own resource. - title, desc, salary (INR, currency, duration [monthly, yearly, hourly]), qualification, expectations_in_role, technologies (must_have, good_to_have, with experience? )
    # HIRING IN REGION - ALL, USA, UK, Germany, EU, APAC,
    # define overlap? - 5 hrs overlap needed with timezone (GMT+5.30)

    attribute :description, :string
    attribute :salary, :string
    attribute :type, :string
  end

  relationships do
    belongs_to :recruiters, CompaniesRegEx.Resources.Recruiters do
      attribute_writable? true
    end
  end
end
