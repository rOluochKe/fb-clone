# frozen_string_literal: true

module ApplicationHelper
  def liked_post?(subject, type)
    liked =  false
    liked = Like. where(user_id: current_user.id, post_id: subject.id). exists? if type == "post"
  end
  def unlike?( subject, type)
    
  end
end
