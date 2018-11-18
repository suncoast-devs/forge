class OnCommentCreateJob < ApplicationJob

  def perform(comment)
    # return unless Rails.env.production?
    mail_client.deliver_with_template({
      template_id: 9006499,
      from: "#{comment.author.name} <admin@suncoast.io>",
      to: ([
          comment.project.requested_by,
          comment.project.claimed_by ] +
          comment.project.comments.map(&:author) -
          [comment.author]
      ).uniq.compact.map(&:to_email_with_name),
      template_model: {
        project_name: comment.project.title,
        comment_text: comment.message,
        comment_html: markdown(comment.message),
        comment_author: comment.author.name,
        action_url: project_url(comment.project)
      }
    })
  end
end
