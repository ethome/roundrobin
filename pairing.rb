#!/usr/bin/env ruby

class Pairing
  def round_robin_pairs(people)
    rounds = []
    people << :alone if people.count.odd?
    (people.count-1).times do

      pairs = []
      (people.count/2).times do |index|
        pairs << [people[index], people[-(index+1)]]
      end

      rounds << pairs
      people = [people.first].concat(people[1..-1].rotate)
    end
    rounds
  end

  def print_rounds(rounds)
    str = ""
    rounds.each_with_index do |round, index|
      str << "Round #{index+1}:\n"
      round.each do |pair|
        if pair[0] == :alone
          str << "#{pair[1]} is alone\n"
        elsif pair[1] == :alone
          str << "#{pair[0]} is alone\n"
        else
          str << "#{pair[0]} and #{pair[1]}\n"
        end
      end
      str << "\n"
    end
    puts str
  end

  def print_itineraries(itineraries)
    str = ''
    itineraries.each do |name, pairs|
      str << "#{name}\n"
      pairs.each_with_index do |pair, index|
        str << "Round #{index + 1}: #{pair}\n"
      end
      str << "\n"
    end
    puts str
  end

  def get_itineraries_from_rounds(rounds)
    itineraries = Hash.new
    rounds.each do |pairs|
      pairs.each do |pair|
        itineraries[pair.first] = Array.new if itineraries[pair.first].nil?
        itineraries[pair.last] = Array.new if itineraries[pair.last].nil?

        itineraries[pair.first] << pair.last
        itineraries[pair.last] << pair.first
      end
    end
    itineraries
  end

  def read_people
    raise "You need to give an input filename." unless ARGV.first
    input_filename = ARGV.first
    begin
      file_text = File.open(input_filename).read
    rescue
      raise "Could not open file"
    end
    file_text.split("\n")
  end

  def run
    rounds = round_robin_pairs(read_people)
    print_rounds(rounds)
    print_itineraries(get_itineraries_from_rounds(rounds))
  end
end
