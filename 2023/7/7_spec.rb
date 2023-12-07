require 'rspec'
  require './7'
  require 'pry'

  RSpec.describe 'Day 7' do
    subject { Day7.new(file) }

    describe 'Part 1' do
      context 'with the example file' do
        let(:file) { 'ex_input.txt' }

        it 'works' do
          expect(subject.part_one).to eq(6440)
        end
      end

      context 'with the main file' do
        let(:file) { 'input.txt' }

        it 'works' do
          expect(subject.part_one).to eq(251136060)
        end
      end
    end

    describe 'Part 2' do
      context 'with the example file' do
        let(:file) { 'ex_input.txt' }

        it 'works' do
          expect(subject.part_two).to eq(5905)
        end
      end

      context 'with the main file' do
        let(:file) { 'input.txt' }

        it 'works' do
          expect(subject.part_two).to eq(249400220)
        end
      end
    end
  end
