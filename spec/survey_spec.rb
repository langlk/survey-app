#!/usr/bin/env ruby

require 'spec_helper'

describe('Survey') do
  describe '.create' do
    it "capitalizes the first letter of each word in the survey title" do
      survey = Survey.create({title: "steven UNIVERSE fan survey"})
      expect(survey.title).to eq('Steven Universe Fan Survey')
    end
  end
end
