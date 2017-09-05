
class DivisionsController < ApplicationController


  def show

      begin
        1/0
      rescue ZeroDivisionError => e
        @zero = e.class.name
        puts "Exception Class: #{ e.class.name }"
        puts "Exception Message: #{ e.message }"
        puts "Exception Backtrace: #{ e.backtrace }"
        logger.error "About to divide by 0 !!!"
      end

  end

end

