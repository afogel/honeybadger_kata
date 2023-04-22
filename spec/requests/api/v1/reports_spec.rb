require 'rails_helper'

RSpec.describe "Api::V1::Reports", type: :request do
  let (:invalid_request) { { message: { body: 'hi' } } }
  let (:spam_report) do
    {
      "RecordType": "Bounce",
      "Type": "SpamNotification",
      "TypeCode": 512,
      "Name": "Spam notification",
      "Tag": "",
      "MessageStream": "outbound",
      "Description": "The message was delivered, but was either blocked by the user, or classified as spam, bulk mail, or had rejected content.",
      "Email": "zaphod@example.com",
      "From": "notifications@honeybadger.io",
      "BouncedAt": "2023-02-27T21:41:30Z",
    }
  end
  let (:non_spam_report) do
    {
      "RecordType": "Bounce",
      "MessageStream": "outbound",
      "Type": "HardBounce",
      "TypeCode": 1,
      "Name": "Hard bounce",
      "Tag": "Test",
      "Description": "The server was unable to deliver your message (ex: unknown user, mailbox not found).",
      "Email": "arthur@example.com",
      "From": "notifications@honeybadger.io",
      "BouncedAt": "2019-11-05T16:33:54.9070259Z",
    }
  end

  describe "POST /reports" do
    context "with invalid request" do
      it "returns 422" do
        post api_v1_reports_path, params: invalid_request
        expect(response).to have_http_status(422)
      end
    end

    context "with spam report" do
      it "returns 200" do
        post api_v1_reports_path, params: spam_report
        expect(response).to have_http_status(200)
      end

      it "sends a message to the spam channel" do
        expect(SlackNotifier::CLIENT).to receive(:chat_postMessage).with(
          channel: '#general',
          text: "You've got spam from: #{spam_report[:Email]}"
        )
        post api_v1_reports_path, params: spam_report
      end
    end

    context "with non-spam report" do
      it "returns 200" do
        post api_v1_reports_path, params: non_spam_report
        expect(response).to have_http_status(200)
      end
    end
  end
end
