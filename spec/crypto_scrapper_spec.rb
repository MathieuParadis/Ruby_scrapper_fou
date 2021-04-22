require_relative '../lib/crypto_scrapper'

describe "crypto_scrapper method" do
  it "should return an array" do
    expect(crypto_scrapper.class).to eq(Array)
  end

  it "should return a non empty array" do
    expect(crypto_scrapper.length).to be > 0
  end

  it "should return an array of hashes" do
    expect(crypto_scrapper[0].class).to eq(Hash)
    expect(crypto_scrapper[1].class).to eq(Hash)
    expect(crypto_scrapper[2].class).to eq(Hash)
  end

  it "should return an array of hashes" do
    expect(crypto_scrapper.map(&:keys).flatten[0].class).to eq(String)
    expect(crypto_scrapper.map(&:keys).flatten[1].class).to eq(String)
    expect(crypto_scrapper.map(&:keys).flatten[2].class).to eq(String)
  end

  it "should return an array of hashes" do
    expect(crypto_scrapper.map(&:values).flatten[0].class).to eq(Float)
    expect(crypto_scrapper.map(&:values).flatten[1].class).to eq(Float)
    expect(crypto_scrapper.map(&:values).flatten[2].class).to eq(Float)
  end
end