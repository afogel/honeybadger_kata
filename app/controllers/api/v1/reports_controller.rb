class Api::V1::ReportsController < ApplicationController
  def create
    report = Report.new(report_params)
    if report.valid?
      alert_spam!(report) if report.spam?
      render json: { message: 'Report received' }, status: :ok
    else
      render json: { message: 'Invalid report' }, status: :unprocessable_entity
    end
  end

  private

  def alert_spam!(report)
    SlackNotifier::CLIENT.chat_postMessage(
      channel: '#general', 
      text: "You've got spam from: #{report.email}"
    )
  end

  def report_params
    params.deep_transform_keys!(&:underscore)
          .permit(:record_type, :type, :type_code, :name, :tag, :message_stream, :description, :email, :from, :bounced_at)
  end
end
