=begin
  
  
=end

class AdminController < ApplicationController
   

  before_filter :authenticate_user! 


  def index
      
      @users = User.select('users.*, (select count(*) from posts where posts.user_id = users.id) as postcount, (select count(*) from votes where votes.voter_id = users.id) as votecount')
      
      @usertotal = @users.size

      @users = @users.paginate(:page => params[:page], :per_page => 50)     

      @users = @users.order("updated_at desc")


    end    

  end

  def new
  

      @user = User.new


    end   

  end

  def edit
   

      @user = User.find(params[:id])


  end

  def create

      @user = User.new(user_params)

      if @user.save

        redirect_to :action => 'index'

      else

        makeflash
        render action: "new"

      end

  end

  def update

    @user = User.find(params[:id])

      if @user.update_attributes(user_params)
        redirect_to :action => 'index'
      else
        makeflash      
        render action: "edit"
      end  

    end         

  end


  private

  def check_for_cancel

      #logger.info("in the cancel action")
      if params[:commit] == "Cancel"

        redirect_to :controller => 'admin', :action => 'index' 

      end

  end

  def user_params
    params.require(:user).permit(:id, :email, :password)
  end

  def makeflash

        # looping through ActiveModel errors in controller, creating a flash error for each one,
        # using the incrementer as the hash key, and using the full message as the hash value

        i = 1
        @user.errors.full_messages.each do |msg|

          flash.now[i] = msg
          i += 1

        end

        return flash

  end  

end
