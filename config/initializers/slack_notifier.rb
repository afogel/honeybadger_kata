Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
end

module SlackNotifier
  CLIENT = Slack::Web::Client.new
end