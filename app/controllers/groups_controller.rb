class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = current_user.groups.order(updated_at: :desc)
  end

  def show
    @group = current_user.groups.find(params[:id])
    @expenses = @group.expenses.order(created_at: :desc)
  end

  def edit
    @group = current_user.groups.find(params[:id])
  end

  def destroy
    @group = current_user.groups.find(params[:id])
    if @group.expenses.any?
      redirect_to groups_path,
                  alert: 'Please move or delete the transactions before deleting the category.'
    else
      @group.destroy
      redirect_to groups_path, notice: 'Category deleted successfully.'
    end
  end

  def update
    @group = current_user.groups.find(params[:id])
    if @group.update(group_params)
      redirect_to groups_path, notice: 'Category updated successfully.'
    else
      render :edit
    end
  end

  def new
    @group = current_user.groups.build
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      redirect_to groups_path, notice: 'Group created successfully.'
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
