#!/usr/bin/env ruby

class Survey < ActiveRecord::Base
  has_many(:questions)
  validates(:title, :presence => true)
  before_save(:capitalize_title)

private
  def capitalize_title
    self.title = self.title.capitalize.split(" ").inject { |title, word| title + " " + word.capitalize }
  end
end
