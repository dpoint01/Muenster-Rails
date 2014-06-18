class JobsController < ApplicationController
	def index
		@jobs = Job.includes(:company).order(updated_at: :desc)
	end

	def show
		@jobs = Job.includes(:company).find(params[:id])
	end
end