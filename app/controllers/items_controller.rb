class ItemsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response


  # def index
  #   items = Item.all
  #   render json: items, include: :user
  # end

  # http://facebook.com/items

def index
  if params[:user_id]
    user = User.find(params[:user_id])
    items = user.items
  else
    items = Item.all
  end
  render json: items, include: :user
end


def show
  if params[:user_id]
  user = User.find(params[:user_id])
 item = user.items.find(params[:id])
  else 
    item = Item.find(params[:id])
  end
 render json: item, include: :user

end

 def create
    user = find_user
    item = user.Item.create(item_params)
    render json: item, status: :created
 end

private

  def find_item
    Item.find(params[:id])
  end

  def find_user
    User.find(params[:user_id])
  end

  def item_params
    params.permit(:name, :description, :price)
  end

  def render_not_found_response(exception)
    render json: { error: "#{exception.model} not found" }, status: :not_found
  end

end







# class DogHousesController < ApplicationController
#   rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

#   def show
#     dog_house = DogHouse.find(params[:id])
#     render json: dog_house
#   end

#   private

#   def render_not_found_response
#     render json: { error: "Dog house not found" }, status: :not_found
#   end

# end
