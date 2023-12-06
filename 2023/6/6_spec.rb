require 'rspec'
  require './6'
  require 'pry'

  RSpec.describe 'Day 6' do
    subject { Day6.new(file) }

    describe 'Part 1' do
      context 'with the example file' do
        let(:file) { 'ex_input.txt' }

        it 'works' do
          expect(subject.part_one).to eq(288)
        end
      end

      context 'with the main file' do
        let(:file) { 'input.txt' }

        it 'works' do
          expect(subject.part_one).to eq(1660968)
        end
      end
    end

    describe 'Part 2' do
      context 'with the example file' do
        let(:file) { 'ex_input.txt' }

        it 'works' do
          expect(subject.part_two).to eq(71503)
        end
      end

      context 'with the main file' do
        let(:file) { 'input.txt' }

        it 'works' do
          expect(subject.part_two).to eq(26499773)
        end
      end
    end
  end
