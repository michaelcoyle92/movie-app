class Actor < ApplicationRecord
  def index
    actor = Actor.all
    render json: actor.as_json
  end

  def create
    actor = Actor.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      known_for: params[:known_for]
    )
    render json: actor.as_json
  end

  def show
    actor = Actor.find_by(id: params[:id])
    render json: actor.as_json
  end

  def update
    actor = Actor.find_by(id: params[:id])

    actor.first_name = params[:first_name] || actor.first_name
    actor.last_name = params[:last_name] || actor.last_name
    actor.known_for = params[:known_for] || actor.known_for

    actor.save
    render json: {message: "updated"}
  end

  def delete
    actor = Actor.find_by(id: params[:id])
    actor.destroy
    render json: {message: "destroyed!"}
  end
end
