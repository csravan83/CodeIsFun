class BasicsController < ApplicationController

  def quotations
    # XML and Json format
    data = Array.new
    @quotation = Quotation.all
    respond_to do |format|
      format.html
      format.json { render json: @quotation }
      @quotation.each do |q|
        data << {:author_name=> q.author_name,:category=>q.category,:quote=>q.quote}
      end
      format.xml { render xml: data }
    end
    # create new quotation
    if params[:quotation]
      @field = 0
      @quotation = Quotation.new(quotation_params)

      if @quotation.save
        flash[:notice] = 'Quotation was successfully created.'
        @quotation = Quotation.new
      end
    else
      @quotation = Quotation.new
    end

    # sort by date or category
    if params[:sort_by] == "date"
      @quotations = Quotation.order(:created_at)
    else
      @quotations = Quotation.order(:category)
    end

    # New Category and Old Category input field
    case params[:newcate]
      when "textf"
        @field  = 1
      when "selectf"
        @field  = 2
      else
        @field  = 0
    end
  end
  # get parameter quotation
  def quotation_params
    params.require(:quotation).permit(:author_name, :category, :quote)
  end
  # export xml file
  def export
    @quotation = Quotation.all
    respond_to do |format|
      format.html
      format.json { render json: @quotation }
      format.xml { render xml: @quotation }
    end
  end

  # delete data
  def destroy
    Quotation.find_by(author_name: params[:author_name]).destroy
    redirect_to basics_quotations_path
  end

  # search author_name
  def findauthor
    if params[:search]
      @results = Quotation.search(params[:search]).order("created_at DESC")
    else
      @results = Quotation.all.order("Created_at DESC")
    end
  end
end
