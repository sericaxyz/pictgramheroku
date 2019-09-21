class CommentsController < ApplicationController

  def new
      @comment = Comment.new
      @topic = Topic.find_by(id: params[:topic_id])
  end

  def create
      comment = Comment.new
      comment.user_id = current_user.id
      comment.topic_id = params[:topic_id]
      comment.content = params[:comment][:content]
  
      if comment.save
        redirect_to topics_path, success: 'コメント登録しました'
      else
        redirect_to topics_path, danger: 'コメント登録に失敗しました'
      end
      

  end
  
end