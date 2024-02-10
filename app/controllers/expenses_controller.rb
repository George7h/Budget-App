class ExpensesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: %i[new create]
  before_action :set_expense, only: %i[edit update destroy]

  def index
    @expenses = current_user.expenses.order(date: :desc)
  end

  def new
    @expense = @group.expenses.build
  end

  def create
    @expense = @group.expenses.build(expense_params)
    @expense.author_id = current_user.id
    if @expense.save
      redirect_to group_path(@group), notice: 'Expense created successfully.'
    else
      render :new
    end
  end

  def edit
    @expense = current_user.expenses.find(params[:id])
    @group = @expense.group
  end

  def update
    if @expense.update(expense_params)
      redirect_to group_path(@expense.group), notice: 'Expense updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @expense.destroy
    redirect_to group_path(@expense.group), notice: 'Expense deleted successfully.'
  end

  private

  def set_group
    @group = current_user.groups.find(params[:group_id])
  end

  def set_expense
    @expense = current_user.expenses.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:name, :amount, :group_id, :date)
  end
end
