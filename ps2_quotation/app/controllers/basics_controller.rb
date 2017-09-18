class BasicsController < ApplicationController

  def quotations

    # XML and Json format
    @quotation = Quotation.all
    respond_to do |format|
      format.html
      format.json { render json: @quotation }
      format.xml { render xml: @quotation }
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

    # require 'builder'
    # @quotation = Quotation.all
    # @file = File.new("/home/wanlipa/Desktop/data.xml", 'w')
    #
    # xml = Builder::XmlMarkup.new(target: @file, :indent => 2)
    # xml.instruct! :xml, :version=>'1.0'
    #
    # xml.tag! 'plist' , 'version' => '1.0' do
    #   xml.array do
    #     @quotation.each do |q|
    #       xml.dict do
    #         xml.key 'author_name'
    #         xml.string q.author_name
    #         xml.key 'category'
    #         xml.string q.category
    #         xml.key 'quote'
    #         xml.string q.quote
    #       end
    #     end
    #   end
    # end
    # # @file.write(xml.target!)
    # @file.close
    # XML and Json format
    @quotation = Quotation.all
    respond_to do |format|
      format.html
      format.json { render json: @quotation }
      format.xml { render xml: @quotation }
    end

    # if params[:act] == "xml"
    #   # @quotation = Quotation.all
    #   # respond_to do |format|
    #   #   format.xml { render xml: @quotation }
    #   # end
    # else
    #   # @quotation = Quotation.all
    #   # respond_to do |format|
    #   #   format.json { render json: @quotation }
    #   # end
    # end
  end

  # delete data
  def destroy
    Quotation.find_by(author_name: params[:author_name]).destroy
    redirect_to basics_quotations_path
  end


  # search author_name
  def findauthor
    @quotation = Quotation.new

    if term = params[:author_name]
      where('author_name LIKE ?', "%#{term}%")
    end
  end

end
