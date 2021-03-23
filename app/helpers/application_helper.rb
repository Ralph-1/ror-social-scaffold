module ApplicationHelper
  def menu_link_to(link_text, link_path)
    class_name = current_page?(link_path) ? 'menu-item active' : 'menu-item'

    content_tag(:div, class: class_name) do
      link_to link_text, link_path
    end
  end

  def like_or_dislike_btn(post)
    like = Like.find_by(post: post, user: current_user)
    if like
      link_to('Dislike!', post_like_path(id: like.id, post_id: post.id), method: :delete)
    else
      link_to('Like!', post_likes_path(post_id: post.id), method: :post)
    end
  end

  def confirm_friend(user)
    friendship = inverse_friendships.find { |inverse_friendship| inverse_friendship.user == user }

    friendship.confirmed = true

    friendship.save
  end

  def shared_posts(user)
    friendship = inverse_friendships.find { |inverse_friendship| inverse_friendship.user == user }

    timeline_posts if friendship.confirmed == true
  end

  def singlepage
    unless @user == current_user
      if current_user.friend?(@user) 
        render 'friendships/reject', user: @user, action_text: 'Unfriend', method: 'delete'
      elsif current_user.pending_friends.include?(@user)
        render 'friendships/reject', user: @user, action_text: 'Cancel request', method: 'delete'
      elsif current_user.friend_requests.include?(@user)
        render 'friendships/accept_friend', user: @user,action_text: 'Accept friend', method: 'put'
        render 'friendships/reject', user: @user, action_text: 'Reject', method: 'delete'
      else
        render 'friendships/add_friend', user: @user, method: 'post', action_text: 'Add firend'
    end
  end
end
end
