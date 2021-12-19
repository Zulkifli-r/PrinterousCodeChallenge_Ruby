class HomeController < ApplicationController
  def index
    @organizations = if params[:search].blank?
                       Organization.all.includes(:people)
                     else
                       Organization
                         .joins('LEFT JOIN people ON people.organization_id = organizations.id')
                         .where('people.name like ? ', "%#{params[:search]}%")
                         .or(Organization.where('organizations.name like ? ', "%#{params[:search]}%"))
                         .group('organizations.id')
                     end
    @organizations = @organizations.latest.paginate(page: params[:page], per_page: Organization::PAGE_LIMIT)
  end

  private

  def home_params
    params.permit(:search, :page)
  end
end
