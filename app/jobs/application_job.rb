class ApplicationJob < ActiveJob::Base
  include Rails.application.routes.url_helpers
  include ApplicationHelper

  protected

  def mail_client
    @mail_client ||= Postmark::ApiClient.new(Rails.application.credentials.postmark_key)
  end
end
