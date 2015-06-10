class ChartsController < ApplicationController
  def completed_tasks
    render json: Mstore.group(:created_at).count
  end
end
