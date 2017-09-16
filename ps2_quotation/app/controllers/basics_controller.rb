class BasicsController < ApplicationController

  def quotations


    if params[:quotation]

      @quotation = Quotation.new(quotation_params)

      if @quotation.save
        flash[:notice] = 'Quotation was successfully created.'
        @quotation = Quotation.new
      end
    else
      @quotation = Quotation.new
    end

    if params[:sort_by] == "date"
      @quotations = Quotation.order(:created_at)
    else
      @quotations = Quotation.order(:category)
    end

  end

  def quotation_params
    params.require(:quotation).permit(:author_name, :category, :quote)
  end

end
