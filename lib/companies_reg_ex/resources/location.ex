# defmodule CompaniesRegEx.Resources.Location do
#   use Ash.Resource, data_layer: AshPostgres.DataLayer

#   postgres do
#     table "locations"
#     repo CompaniesRegEx.Repo
#   end

#   code_interface do
#     define_for CompaniesRegEx.Resources
#     define :create, action: :create
#     define :read_all, action: :read
#     define :update, action: :update
#     define :destroy, action: :destroy
#     define :get_by_id, args: [:id], action: :by_id
#   end

#   actions do
#     defaults [:create, :read, :update, :destroy]

#     read :by_id do
#       argument :id, :uuid, allow_nil?: false
#       # Tells us we expect this action to return a single result
#       get? true
#       filter expr(id == ^arg(:id))
#     end
#   end

#   attributes do
#     uuid_primary_key :id

#     attribute :region, :string
#   end
# end
