require 'rails_helper'
require 'swagger_helper'

RSpec.describe "Items", type: :request do
  let(:user) { create(:user) }
  let(:"Authorization") { "Bearer #{token_generator(user.id)}" }
  let(:item) { create(:item, :with_options) }
  let(:id) { item['id'] }

  path '/api/items' do
    get 'Index a Item' do
      tags 'Items'
      consumes 'application/json', 'application/xml'
      security [Bearer: {}]

      response '200', 'item list' do
        run_test!
      end
    end
  end

  path '/api/items/{id}' do
    get 'Show a Item' do
      tags 'Items'
      consumes 'application/json', 'application/xml'
      security [Bearer: {}]
      parameter name: :id, in: :path, type: :string

      response '200', 'item show' do
        run_test!
      end
    end
  end
end
