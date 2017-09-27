#!/usr/bin/env ruby

require "spec_helper"

describe('Answer') do
  let(:survey) { Survey.create({title: "Best Pizza in Seattle"}) }

  describe '#save' do
    it "does not allow a blank answer" do
      question = Question.create({question_text: "What is your favorite kind of Pizza?", number: 1, survey_id: survey.id})
      answer = Answer.new({answer_text: "", question_id: question.id})
      expect(answer.save).to eq(false)
    end

    it "does not allow an answer to be assigned to a question that doesn't exist" do
      question = Question.create({question_text: "What is your favorite kind of Pizza?", number: 1, survey_id: survey.id})
      answer = Answer.create({answer_text: "New York", question_id: (question.id + 1)})
      expect(answer.save).to eq(false)
    end
  end

  describe '#question' do
    it "returns the question that an answer belongs to" do
      question = Question.create({question_text: "What is your favorite kind of Pizza?", number: 1, survey_id: survey.id})
      answer = Answer.create({answer_text: "New York", question_id: question.id})
      expect(answer.question).to eq(question)
    end
  end
end
