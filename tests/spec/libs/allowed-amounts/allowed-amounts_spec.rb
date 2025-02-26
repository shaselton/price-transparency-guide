require "spec_helper"
require "json"
#JsonMatchers.schema_root = "../schemas/allowed-amounts"

describe "allowed amounts schema" do
  it "has a valid json schema" do
    begin
      expect{ match_response_schema("../allowed-amounts/allowed-amounts") }.not_to raise_error
    rescue RSpec::Expectations::ExpectationNotMetError => e
      expect(e.message).not_to include "AError"
    end
  end

  it "validates the allowed amounts example" do
    json_data = JSON.parse(File.read("../examples/allowed-amounts/allowed-amounts.json"))

    expect(json_data).to match_response_schema("../allowed-amounts/allowed-amounts")
  end

  it "validates the allowed amounts empty example" do
    json_data = JSON.parse(File.read("../examples/allowed-amounts/allowed-amounts-empty.json"))

    expect(json_data).to match_response_schema("../allowed-amounts/allowed-amounts")
  end
end
