class Report
  attr_reader :record_type, :type, :type_code, :name, :tag, 
              :message_stream, :description, :email, :from, 
              :bounced_at

  def initialize(params)
    @record_type = params["record_type"]
    @type = params["type"]
    @type_code = params["type_code"]
    @name = params["name"]
    @tag = params["tag"]
    @message_stream = params["message_stream"]
    @description = params["description"]
    @email = params["email"]
    @from = params["from"]
    @bounced_at = params["bounced_at"]
  end

  def spam?
    @type == "SpamNotification"
  end

  def valid?
    !instance_variables.map { |var| instance_variable_get(var) }.any?(nil)
  end
end