defmodule PhoenixGraphqlTutorialWithAbsinthe.Schema do
  use Absinthe.Schema
  import_types PhoenixGraphqlTutorialWithAbsinthe.Schema.Types
 
  query do
    field :posts, list_of(:post) do
      resolve &PhoenixGraphqlTutorialWithAbsinthe.PostResolver.all/2
      # resolve &PhoenixGraphqlTutorialWithAbsinthe.PostResolver.last/2
    end
 
    field :users, list_of(:user) do
      resolve &PhoenixGraphqlTutorialWithAbsinthe.UserResolver.all/2
    end

    field :user, type: :user do
      arg :id, non_null(:id)
      resolve &PhoenixGraphqlTutorialWithAbsinthe.UserResolver.find/2
    end
  end

  input_object :update_post_params do
    field :title, non_null(:string)
    field :body, non_null(:string)
    field :user_id, non_null(:integer)
  end

  input_object :update_user_params do
    field :name, :string
    field :email, :string
    field :password, :string
  end

  mutation do
    field :update_user, type: :user do
      arg :id, non_null(:integer)
      arg :user, :update_user_params

      resolve &PhoenixGraphqlTutorialWithAbsinthe.UserResolver.update/2
    end

    field :create_post, type: :post do
      arg :title, non_null(:string)
      arg :body, non_null(:string)
      arg :user_id, non_null(:integer)

      resolve &PhoenixGraphqlTutorialWithAbsinthe.PostResolver.create/2
    end

    field :update_post, type: :post do
      arg :id, non_null(:integer)
      arg :post, :update_post_params

      resolve &PhoenixGraphqlTutorialWithAbsinthe.PostResolver.update/2
    end

    field :delete_post, type: :post do
      arg :id, non_null(:integer)
 
      resolve &PhoenixGraphqlTutorialWithAbsinthe.PostResolver.delete/2
    end

    field :login, type: :session do
      arg :email, non_null(:string)
      arg :password, non_null(:string)

      resolve &PhoenixGraphqlTutorialWithAbsinthe.UserResolver.login/2
    end
  end
end
