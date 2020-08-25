class ConversionCreditController < ApplicationController
  def index
  end

  def calculate
    if params[:in].present? && params[:out].present?
      conversion_calculator = ConversionCalculator.new(params[:in].split(","), params[:out].split(","))
      flash[:notice] = "Конверсия #{conversion_calculator.conversion}"
      redirect_to action: :index
    else
      flash[:error] = "неверный формат данных"
      redirect_to action: :index
    end
  end
end
