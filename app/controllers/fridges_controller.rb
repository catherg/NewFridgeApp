class FridgesController < ApplicationController
    before_action :set_fridge_contents, only: [:show, :increment_item, :delete_item]

    def show
    end

    def increment_item
        #item to add is the index
        index = params[:item_id].to_i
        split_arr = session[:fridge_contents][index].split
        num = (split_arr[0].to_i) + 1
        new_item = num.to_s + " " + split_arr[1..-1].join(' ')
        session[:fridge_contents][index] = new_item
        redirect_to fridges_path  # Redirect back to the show page
    end

    def add_item
        #item to add is the index
        item = "1" + params[:item_id].to_s
        session[:fridge_contents] << item unless session[:fridge_contents].include?(item)
        redirect_to fridges_path  # Redirect back to the show page
    end

    def delete_item
        #item to add is the index
        index = params[:item_id].to_i
        split_arr = session[:fridge_contents][index].split
        num = (split_arr[0].to_i) - 1
        new_item = num.to_s + " " + split_arr[1..-1].join(' ')
        session[:fridge_contents][index] = new_item
        redirect_to fridges_path  # Redirect back to the show page
    end

    def submit_form
        # Here you process the input data
        item_info = params[:info].to_s
        # You might want to redirect or render something here
        add_item(@input_data)
      end


    def set_fridge_contents
        # This could be fetching from a database in a real app
        session[:fridge_contents] ||= ['2 Onion', '1 orange', '3 Milk']
        @fridge_contents = session[:fridge_contents]
    end
end
