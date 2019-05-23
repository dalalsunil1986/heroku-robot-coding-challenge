class RobotsController < ApplicationController

  def index
    @robots = Robot.all
  end

  def new
    @robot = Robot.new
  end

  def create
    @robot = Robot.new(allowed_params)
    if @robot.valid?
      x = allowed_params[:name].split(" ")
      y = x.join
      @robot.image_url = "https://robohash.org/#{y}"
      @robot.save
      redirect_to robots_path
    else
      render :new
    end
  end

  def search
    query = params[:q]
    @robots = []
    robots = Robot.all.each do |x|
      if x.name.downcase.include?(query.downcase)
        @robots << x
      end
    end
    @robots
  end

  def show
    @robot = Robot.find(params[:id])
    @abilities = Ability.all
  end

  def edit
    @robot = Robot.find(params[:id])
    @abilities = Ability.all
  end

  def update
    @robot = Robot.find(params[:id])
    @robot.assign_attributes(allowed_params)
    if @robot.valid?
      x = allowed_params[:name].split(" ")
      y = x.join
      @robot.image_url = "https://robohash.org/#{y}"
      @robot.update(allowed_params)
      redirect_to robot_path
    else
      render :edit
    end
  end

  def destroy
    @robot = Robot.find(params[:id])
    @robot.destroy
    redirect_to robots_path
  end

private

def allowed_params
  params.require(:robot).permit(:name, :ability_id)
end
end
