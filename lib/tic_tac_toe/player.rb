# frozen_string_literal: true

# Represents the player
class Player
  attr_reader :name, :option

  def initialize(name, option)
    @name = name
    @option = option
  end
end
