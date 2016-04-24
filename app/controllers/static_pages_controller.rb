class StaticPagesController < ApplicationController
	before_action :require_logout, only: :home

	def home
	end

	def contact
	end

	def about
	end
end
