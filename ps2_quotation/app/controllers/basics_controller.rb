class BasicsController < ApplicationController

  require 'rake'
  require 'open-uri'
  require 'nokogiri'

  list = Array.new

  def quotations

    # XML and Json format
    data = Array.new
    @quotation = Quotation.all
    respond_to do |format|

      if params[:format] == "json"
        format.json { render json: @quotation }
      elsif params[:format] == "xml"
        @quotation.each do |q|
          data << {:author_name=>q.author_name,:category=>q.category,:quote=>q.quote,:created_at=>q.created_at,:updated_at=>q.updated_at}
        end
        format.xml { render xml: data.to_xml(:root => 'quotations', :children => 'quotation', skip_types: true, :dasherize => false) }
      else
        format.html
      end

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

    # cookies list
    if cookies[:selectq] != nil
      list = cookies[:selectq].split(' ').collect! {|n| n.to_i}
      @showlist = list
    end
    # sort by date or category
    if params[:sort_by] == "date"
      @quotations = Quotation.where.not(id: list).order(:created_at)
    else
      @quotations = Quotation.where.not(id: list).order(:category)
    end

    if params[:erase] == "yes"
      cookies.delete(:selectq)
      @quotations = Quotation.order(:created_at)
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
    params.require(:quotation).permit!
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
    # Quotation.find_by(author_name: params[:author_name]).destroy
    cookies[:selectq] = '' if cookies[:selectq].nil?
    cookies[:selectq] = cookies[:selectq] + ' ' + params[:id]
    redirect_to basics_quotations_path

  end



  # search author_name
  def findauthor
    if cookies[:selectq] != nil
      list = cookies[:selectq].split(' ').collect! {|n| n.to_i}
    end
    if params[:search]
      @results = Quotation.search(params[:search])
      @results = @results.where.not(id: list)
    else
      @results = Quotation.where.not(id: list)
    end
  end

  def import
    doc = Nokogiri::XML(params[:import_xml])
    doc.css('quotation').each do |f|
      Quotation.create do |q|
        q.author_name = f.css("author_name").first.text
        q.category = f.css("category").first.text
        q.quote = f.css("quote").first.text
        q.created_at = f.css("created_at").first.text
        q.updated_at = f.css("updated_at").first.text
      end
    end
  end



end
