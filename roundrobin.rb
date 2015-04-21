require_relative 'pairing'

class RoundRobin
  def self.run
    pairing = Pairing.new
    pairing.run
  end
end

RoundRobin.run