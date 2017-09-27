#!/usr/bin/env ruby

require "spec_helper"

describe('Answer') do
  let(:survey) { Survey.create({title: "Best Pizza in Seattle"}) }

  describe '#question' do
    it "returns the question that an answer belongs to" do
      question = Question.create({question_text: "What is your favorite kind of Pizza?", number: 1, survey_id: survey.id})
      answer = Answer.create({answer_text: "New York", question_id: question.id})
      expect(answer.question).to eq(question)
    end
  end
end
