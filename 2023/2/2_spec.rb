require 'rspec'
  require './2'
  require 'pry'

  RSpec.describe 'Day 2' do
    subject { Day2.new(file) }

    describe 'Part 1' do
      context 'with the example file' do
        let(:file) { 'ex_input.txt' }

        it 'works' do
          expect(subject.part_one).to eq(8)
        end
      end

      context 'with the main file' do
        let(:file) { 'input.txt' }

        it 'works' do
          expect(subject.part_one).to eq(3059)
        end
      end
    end

    describe 'Part 2' do
      context 'with the example file' do
        let(:file) { 'ex_input.txt' }

        it 'works' do
          expect(subject.part_two).to eq(2286)
        end
      end

      context 'with the main file' do
        let(:file) { 'input.txt' }

        it 'works' do
          expect(subject.part_two).to eq(65371)
        end
      end
    end
  end
