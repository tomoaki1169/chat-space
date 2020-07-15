class GroupsController < ApplicationController

  def index
  end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path,notice: 'グループを作成しました'
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to group_messsages_path(@group),notice: 'グループを更新しました'
    else
      render :edit
    end
  end


  private
  def group_params
    params.require(:group).permit(:name,user_ids: [])
  end
  def after_inactive_sign_up_path_for(resource)
    root_path(id)
  end
end
