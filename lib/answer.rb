#!/usr/bin/env ruby

class Answer < ActiveRecord::Base
  belongs_to(:question)
  validates(:answer_text, :question, presence: true)
end
