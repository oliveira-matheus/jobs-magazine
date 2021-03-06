class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @companies = Company.new
  end

  def create
    
    @company = Company.new(company_params)
    #@company.user = current_user
    @company.website = current_user.email.split('@').last
    if @company.save
      current_user.update(company: @company)
      redirect_to @company
    else
      render :new
    end
  end

  def search
    @companies = Company.where('name like ? OR website like ?',
      "%#{params[:q]}%", "%#{params[:q]}%")
  end

  private
    def company_params
      params.require(:company).permit(:name, :address, :cnpj, :website, :founded, :logo)
    end
end
