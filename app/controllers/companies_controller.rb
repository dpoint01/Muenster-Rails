class CompaniesController < ApplicationController
	

	def index
		@companies = Company.all
	end

	def show
		@companies = Company.find(params[:id])
		@jobs = Job.where("company_id = ?",params[:id])
	end

	def new
		@company = Company.new
	end

	def create
		@company = Company.new(article_params)

	    if @company.save
	      redirect_to @company, notice: 'Company was successfully created.'
	    else
	      render action: 'new'
	    end
	end

	private

	def article_params
		# Never trust parameters from the scary internet, only allow the white list through.
		params.require(:company).permit(:name, :description, :industry, :location)
	end
end