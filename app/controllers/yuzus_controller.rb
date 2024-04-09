class YuzusController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    def top
    end
    def index
        @yuzus = Yuzu.all
        if params[:search] == nil
          @yuzus= Yuzu.all
        elsif params[:search] == ''
          @yuzus= Yuzu.all
          @comments = @yuzu.comments
          @comment = Comment.new
        else
          @yuzus = Yuzu.where("body LIKE ? ",'%' + params[:search] + '%')
        end
    end
    def new
        @yuzu = Yuzu.new
      end
    
      def create
        yuzu = Yuzu.new(yuzu_params)
        yuzu.user_id = current_user.id
        if yuzu.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @yuzu = Yuzu.find(params[:id])
        @comments = @yuzu.comments
        @comment = Comment.new
      end

      def destroy
        yuzu = Yuzu.find(params[:id])
        yuzu.destroy
        redirect_to action: :index
      end

      def edit
        @yuzu = Yuzu.find(params[:id])
      end    

      def update
        yuzu = Yuzu.find(params[:id])
        if yuzu.update(yuzu_params)
          redirect_to :action => "show", :id => yuzu.id
        else
          redirect_to :action => "new"
        end
      end
    
      private
      def yuzu_params
        params.require(:yuzu).permit(:title, :image, :body)
      end
end
