class Api::V1::User::AuthsController < Api::V1::User::ApplicationController
  before_action :set_tmp

  def index
    @tmp[:action] = "index action"
    render json: { status: 'SUCCESS', message: 'It is for you', data: @tmp }
  end

  def create
    @tmp[:action] = "create action"
    render json: { status: 'SUCCESS', message: 'It is for you', data: @tmp }
  end
  
  def destroy
    @tmp[:action] = "destroy action"
    render json: { status: 'SUCCESS', message: 'It is for you', data: @tmp }
  end
  
  def update
    @tmp[:action] = "update action"
    render json: { status: 'SUCCESS', message: 'It is for you', data: @tmp }
  end

  def detail
    @tmp[:action] = "detail action"
    render json: { status: 'SUCCESS', message: 'It is for you', data: @tmp }
  end
  
  private
  
  def set_tmp
    @tmp = {
      action: 'value of action',
      value: 11
    }
  end
end