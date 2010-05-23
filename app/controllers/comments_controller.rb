class CommentsController < ApplicationController
  
  # def new
  #   @comment = Comment.new
  # end
  
  def create
    klass = params[:comment][:commentable_type].classify.constantize
    @parent = klass.find(params[:parent_id])
    # @comment = Comment.new(params[:comment])
    @comment = @parent.comments.build params[:comment]
    @comment.user = current_user
    if @parent.save
      flash[:success] = "Comentário adicionado"
      flash[:comment_created] = true
    else
      flash[:error] = "Não foi possível adicionar o comentário"
    end
    redirect_to polymorphic_path(@parent)
  end
  
end
