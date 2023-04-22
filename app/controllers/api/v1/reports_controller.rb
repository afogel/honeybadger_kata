class Api::V1::ReportsController < ApplicationController
  before_action :underscore_params!

  def create
    if valid_payload?
      render json: { message: 'Report received' }, status: :ok
    else
      render json: { message: 'Invalid report' }, status: :unprocessable_entity
    end
  end

  private

  def valid_payload?
    false
  end

  def underscore_params!
    params.deep_transform_keys!(&:underscore)
  end

  def reports_params
    params.require(:report).permit(:record_type, :type, :type_code, :name, :tag, :message_stream, :description, :email, :from, :bounced_at)
  end
end
