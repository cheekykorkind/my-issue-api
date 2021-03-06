require 'swagger_helper'

describe 'Users API', type: :request do
  path '/api/v1/auths' do
    get 'User list' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'

      response '200', 'user list found' do
        run_test! do
          expect(JSON.parse(response.body)["data"]["action"]).to eq "index action"
        end
      end
    end

    post 'Create User' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: ['name']
      }

      response '201', 'user created' do
        let(:user) { { name: 'iam_new' } }
        run_test! do
          expect(JSON.parse(response.body)["data"]["action"]).to eq "create action"
        end
      end
    end



  end

  path '/api/v1/auths/{user_code}' do
    let(:user_code) { "user-0001" }

    delete 'Delete User' do
      tags 'Users'

      consumes 'application/json'
      produces 'application/json'

      parameter name: :user_code, in: :path, type: :string, description: 'user code'

      response '204', 'delete success' do
        run_test!
      end
    end
  end


  # path '/blogs/{id}' do

  #   get 'Retrieves a blog' do
  #     tags 'Blogs'
  #     produces 'application/json', 'application/xml'
  #     parameter name: :id, in: :path, type: :string

  #     response '200', 'blog found' do
  #       schema type: :object,
  #         properties: {
  #           id: { type: :integer },
  #           title: { type: :string },
  #           content: { type: :string }
  #         },
  #         required: [ 'id', 'title', 'content' ]

  #       let(:id) { Blog.create(title: 'foo', content: 'bar').id }
  #       run_test!
  #     end

  #     response '404', 'blog not found' do
  #       let(:id) { 'invalid' }
  #       run_test!
  #     end

  #     response '406', 'unsupported accept header' do
  #       let(:'Accept') { 'application/foo' }
  #       run_test!
  #     end
  #   end
  # end
end