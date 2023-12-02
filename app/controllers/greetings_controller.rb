class GreetingsController < ApplicationController
  def random
    render json: { greeting: Greeting.order('RANDOM()').first&.message || 'No greetings available' }
  end
end
