
class DivisionsController < ApplicationController


  def show
    @number1 = params[:number1].to_i
    @number2 = params[:number2].to_i


    begin
      @show = @number1 / @number2
    rescue ZeroDivisionError => e
      @msg = e.message
      @name = e.class.name
      @btrace = e.backtrace
      logger.error "About to divide by 0 !!!"
    end

  end

end
