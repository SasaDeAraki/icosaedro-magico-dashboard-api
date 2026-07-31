class CampaignsUsersSerializer < Blueprinter::Base
  view :last_visited do
    transform CamelCaseTransformer

    field :last_visited
  end
end
