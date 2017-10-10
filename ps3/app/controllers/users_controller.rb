class UsersController < ApplicationController
  def index

  end
  def admin

  end
  def user

  end
  def user1

  end

  def txt
    respond_to do |format|
      format.text { render :plain => File.open(File.join(asset_path "hello.txt"))}
    end

  end


  def dbdump
    # @text = String.new
    #
    #
    # IO.foreach "/home/wanlipa/Desktop/web17-01/ps3/public/hello.txt" do |line|
    # #File.open("/home/wanlipa/Desktop/web17-01/ps3/public/hello.txt").each_line do |line|
    #   #@text += line
    #   #puts @text
    #
    #   @text << line
    #
    # end

  end
end
