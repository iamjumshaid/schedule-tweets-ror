class AboutController < ApplicationController
    def index
        flash.now[:about] = "You have arrived at the about page." 
    end
end