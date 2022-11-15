class PublicController < ApplicationController

    def index
        @communities = Community.all.order(id: :desc).limit(5)
        @posts = Post.order(id: :desc).limit(20)
    end

    def profile
        @profile = Account.find_by_username params[:username]
        @posts = @profile.posts.order(id: :desc).limit(10)
        @subscriptions = Subscription.where(account_id: @profile.id)
        @karma = @profile.karma
    end

end