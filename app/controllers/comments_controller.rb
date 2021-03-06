class CommentsController < ApplicationController

  def create
    if logged_in?
    user = User.find_by(id: session[:user_id])
    post = Post.find(params[:comment][:post_id])
    user.comments.create(params_comment)
    redirect_to post_path(post)
  else
    redirect_to users_login_signup_path
  end
end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    post = Post.find(comment.post_id)
    comment.update_attributes(params_comment)
    redirect_to post_path(post.id)
  end

  private

  def params_comment
    params.require(:comment).permit(:content,:post_id)
  end

end
