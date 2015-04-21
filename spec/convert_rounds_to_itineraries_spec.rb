require 'spec_helper'
require_relative '../pairing'

describe Pairing do

  context 'when given a set of pairs' do
    rounds = [[%w(Angel Beccie), %w(George Gordy)],
              [%w(Angel George), %w(Gordy Beccie)],
              [%w(Angel Gordy), %w(Beccie George)]]

    it 'should convert them to itineraries' do
      pairing = Pairing.new
      itineraries = pairing.get_itineraries_from_rounds(rounds)

      expect(itineraries['Angel']).to include('Beccie', 'George', 'Gordy')
      expect(itineraries['Beccie']).to include('Angel', 'George', 'Gordy')
      expect(itineraries['George']).to include('Angel', 'Beccie', 'Gordy')
      expect(itineraries['Gordy']).to include('Angel', 'Beccie', 'George')
    end

    it 'should not have duplicate entries' do
      pairing = Pairing.new
      itineraries = pairing.get_itineraries_from_rounds(rounds)

      expect(itineraries['Angel']).to have_exactly(3).items
      expect(itineraries['Beccie']).to have_exactly(3).items
      expect(itineraries['George']).to have_exactly(3).items
      expect(itineraries['Gordy']).to have_exactly(3).items
    end
  end
end