class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
    def current_chart
      Chart.find(session[:chart_id])
    rescue ActiveRecord::RecordNotFound
      chart = Chart.create
      session[:chart_id] = chart.id
      chart
    end
end
