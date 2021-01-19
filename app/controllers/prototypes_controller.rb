class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create, :edit, :destroy]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
    @prototype.save
  end
  
  def create
    @prototype = Prototype.create(prototype_params)
      if @prototype.save
        redirect_to root_path
      else
        redirect_to new_prototype_path
      end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    prototype = Prototype.find(params[:id])
      if prototype.update(prototype_params)
        redirect_to prototype_path
      else
        redirect_to edit_prototype_path
      end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    if prototype.destroy
      redirect_to root_path
    end
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  private

  def prototype_params
  params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end


end
