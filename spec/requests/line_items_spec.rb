require 'rails_helper'
require 'swagger_helper'

RSpec.describe "LineItems", type: :request do
  let(:user) { create(:user) }
  let(:headers) { valid_headers }
  let(:"Authorization") { "Bearer #{token_generator(user.id)}" }
  let(:item) { create(:item, :with_options) }
  let(:cart) { create(:cart, user: user) }
  let(:line_item) { create(:line_item, item: item, cart: cart) }
  let(:valid_params) { { quantity: 6 } }
  let(:invalid_params) { { quantity: nil } }
  let(:id) { line_item['id'] }
  let(:headers) { valid_headers }

  path '/api/line_items' do
    post 'Creates a LineItem' do
      tags 'Line Items'
      consumes 'application/json', 'application/xml'
      security [Bearer: {}]
      parameter name: :line_item, in: :body, schema: {
        type: :object,
        properties: {
          item_id: { type: :integer },
          cart_id: { type: :integer },
          article: { type: :string },
          quantity: { type: :integer }
        },
        required: [ 'item_id', 'article', 'quantity' ]
      }

      response '200', 'line_item created' do
        let(:line_item) { create(:line_item, item: item, cart: cart) }
        run_test! do |response|
          expect(response).to be_success
        end
      end

      response '422', 'invalid request' do
        let(:line_item) { { name: 'foo', item: item, cart: cart } }
        run_test!
      end
    end
  end

  path '/api/line_items/{id}' do
    put 'Update a LineItem' do
      tags 'Line Items'
      consumes 'application/json', 'application/xml'
      security [Bearer: {}]
      parameter name: :id, in: :path, type: :string
      parameter name: :line_item, in: :body, schema: {
        type: :object,
        properties: {
          article: { type: :string },
          quantity: { type: :integer }
        }
      }

      response '200', 'line_item updated' do
        before { put "/api/line_items/#{id}", params: valid_params.to_json, headers: headers }

        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end

        it 'updates the line_item' do
          updated_line_item = LineItem.find(id)
          expect(updated_line_item.quantity).to eq(6)
        end
      end
    end

    delete 'Delete a LineItem' do
      tags 'Line Items'
      consumes 'application/json', 'application/xml'
      security [Bearer: {}]
      parameter name: :id, in: :path, type: :string

      response '200', 'line_item deleted' do
        run_test!
      end
    end
  end
end
