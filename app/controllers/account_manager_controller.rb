class AccountManagerController < ApplicationController
  before_action :set_organization, only: %i[new create destroy]
  def new
    @organization = Organization.find(params[:organization_id])
    @users = User.is_not_admin.where('NOT EXISTS (:organizations)', organizations:
                                     Organization.where('users.id = organizations.users_id'))
  end

  def create
    if @organization.update(users_id: params[:user_id])
      redirect_to organization_url(@organization), notice: 'Account Manager has been assigned.'
    end
  end

  def destroy
    if @organization.update_attribute(:users_id, nil)
      redirect_to organization_url(@organization), notice: 'Account Manager has been unassigned.'
    end
  end

  private

  def set_organization
    @organization = Organization.find(params[:organization_id])
  end
end
