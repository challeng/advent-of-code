require 'rspec'
  require './1'
  require 'pry'

  RSpec.describe 'Day 1' do
    subject { Day1.new(file) }

    describe 'Part 1' do
      context 'with the example file' do
        let(:file) { 'ex_input.txt' }

        it 'works' do
          expect(subject.part_one).to eq(142)
        end
      end

      context 'with the main file' do
        let(:file) { 'input.txt' }

        it 'works' do
          expect(subject.part_one).to eq(54573)
        end
      end
    end

    describe 'Part 2' do
      context 'with the example file' do
        let(:file) { 'ex_input2.txt' }

        it 'works' do
          expect(subject.part_two).to eq(281)
        end
      end

      context 'with the main file' do
        let(:file) { 'input.txt' }

        it 'works' do
          expect(subject.part_two).to eq(54591)
        end
      end
    end
  end
