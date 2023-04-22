class Api::V1::ReportsController < ApplicationController
  def create
    report = Report.new(report_params)
    if report.valid?
      render json: { message: 'Report received' }, status: :ok
    else
      render json: { message: 'Invalid report' }, status: :unprocessable_entity
    end
  end

  private

  def valid_payload?
    false
  end

  def report_params
    params.deep_transform_keys!(&:underscore)
          .permit(:record_type, :type, :type_code, :name, :tag, :message_stream, :description, :email, :from, :bounced_at)
  end
end
