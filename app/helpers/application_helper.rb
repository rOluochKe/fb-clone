# frozen_string_literal: true

module ApplicationHelper
  def liked_post?(subject, type)
    liked = Like.where(user_id: current_user.id, post_id: subject.id).exists? if type == "post"
  end
end
