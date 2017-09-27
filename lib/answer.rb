#!/usr/bin/env ruby

class Answer < ActiveRecord::Base
  belongs_to(:question)
end
