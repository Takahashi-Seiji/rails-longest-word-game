require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    message
    compute_score
  end

  private

  def check_letter
    @answer = params[:answer]&.upcase
    @letters = params[:letters]
    @answer.chars.all? { |letter| @answer.count(letter) <= @letters.count(letter) }
  end

  def message
    if check_letter
      if check_language
        @message = 'Well done'
      else
        @message = 'Ayo what? Not an english word'
      end
    else
      @message = 'Ayo, do not cheat!'
    end
  end

  def compute_score
    @answer = params[:answer]
    @score = @answer.length * 5
  end

  def check_language
    @answer = params[:answer]
    url = "https://wagon-dictionary.herokuapp.com/#{@answer}"
    word_serialized = URI.open(url).read
    @answer = JSON.parse(word_serialized)
    @answer['found']
  end
end
