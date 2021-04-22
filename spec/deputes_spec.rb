require_relative '../lib/deputes'

describe "get names method" do
  it "should return an array" do
    expect(get_names("https://www2.assemblee-nationale.fr/deputes/liste/alphabetique").class).to eq(Array)
  end

  it "should return a non empty array" do
    expect(get_names("https://www2.assemblee-nationale.fr/deputes/liste/alphabetique").length).to be > 0
  end

  it "should return an array of string" do
    expect(get_names("https://www2.assemblee-nationale.fr/deputes/liste/alphabetique")[0].class).to eq(String)
    expect(get_names("https://www2.assemblee-nationale.fr/deputes/liste/alphabetique")[5].class).to eq(String)
    expect(get_names("https://www2.assemblee-nationale.fr/deputes/liste/alphabetique")[10].class).to eq(String)
  end
end

describe "get email method" do
  it "should return a string" do
    expect(get_email("https://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA719770").class).to eq(String)
    expect(get_email("https://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA721158").class).to eq(String)
    expect(get_email("https://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA719162").class).to eq(String)
  end

  it "should return an email address string" do
    expect(get_email("https://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA266797")).to include("@")
    expect(get_email("https://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA337483")).to include("@")
    expect(get_email("https://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA643127")).to include("@")
  end
end

describe "get deputes urls method" do
  it "should return an array" do
    expect(get_deputes_urls("https://www2.assemblee-nationale.fr/deputes/liste/alphabetique").class).to eq(Array)
  end

  it "should return a non empty array" do
    expect(get_deputes_urls("https://www2.assemblee-nationale.fr/deputes/liste/alphabetique").length).to be > 0
  end

  it "should return an array of urls" do
    expect(get_deputes_urls("https://www2.assemblee-nationale.fr/deputes/liste/alphabetique").all? { |url| url.include?(".fr/") }).to eq(true)
  end
end

# describe "collect deputes info method" do
#   it "should return an array" do
#     expect(collect_deputes_info("https://www2.assemblee-nationale.fr/deputes/liste/alphabetique").class).to eq(Array)
#   end

#   it "should return a none empty array" do
#     expect(collect_deputes_info("https://www2.assemblee-nationale.fr/deputes/liste/alphabetique").length).to be > 0
#   end
# end


