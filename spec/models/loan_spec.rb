require 'rails_helper'

RSpec.describe Loan, type: :model do
  describe 'custom validations' do
    describe 'book available' do
      context 'when book has quantity_remaining over zero' do
        it 'has errors' do
          
        end
      end
    end
  end
end