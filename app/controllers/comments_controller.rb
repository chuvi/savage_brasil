class CommentsController < ApplicationController
  
  def create
    type = params[:comment][:commentable_type]
    klass = type.classify.constantize
    @parent = klass.find(params[:parent_id])
    @comment = @parent.comments.build params[:comment]
    @comment.user = current_user
    if @parent.save
      flash[:success] = "Comentário adicionado"
      flash[:comment_created] = true
      Event.create :kind => "create_#{type}_comment", type.to_sym => @parent, :user => current_user
    else
      flash[:error] = "Não foi possível adicionar o comentário"
    end
    redirect_to polymorphic_path(@parent)
  end
  
end
