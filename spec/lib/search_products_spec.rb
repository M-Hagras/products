require 'rails_helper'
require 'search_products'

RSpec.describe SearchProducts, type: :helper do
  before do
    @helper = SearchProducts.new({}, 1)
  end
  describe "generate query string" do
    it "using department only" do
      expect(@helper.send(:generate_query_string, 1, '', '')).to eq("department_id=1")
    end

    it "using promotion only" do
      expect(@helper.send(:generate_query_string, '', 2, '')).to eq("promotion_id=2")
    end

    it "using name only" do
      expect(@helper.send(:generate_query_string, '', '', 'name')).to eq("name LIKE '%name%'")
    end

    it "using combined" do
      expect(@helper.send(:generate_query_string, 1, 2, 'name')).to eq("department_id=1 AND promotion_id=2 AND name LIKE '%name%'")
    end
  end
end
