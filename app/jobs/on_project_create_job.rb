class OnProjectCreateJob < ApplicationJob

  def perform(project)
    return unless Rails.env.production?
    mail_client.deliver_with_template({
      template_id: 9006186,
      from: "#{project.requested_by.name} <admin@suncoast.io>",
      to: User.where.not(id: project.requested_by_id).map(&:to_email_with_name),
      template_model: {
        project_name: project.title,
        project_creator: project.requested_by.name,
        action_url: project_url(project)
      }
    })
  end
end
