require_relative '../lib/mairie_Xmas'

describe "get townhall email method" do
  it "should return a hash city name / email" do
    expect(get_townhall_email("https://www.annuaire-des-mairies.com/95/aincourt.html")).to eq({"AINCOURT" => "mairie.aincourt@wanadoo.fr"})
    expect(get_townhall_email("https://www.annuaire-des-mairies.com/95/frepillon.html")).to eq({"FREPILLON" => "mairie@frepillon.fr"})
    expect(get_townhall_email("https://www.annuaire-des-mairies.com/95/soisy-sous-montmorency.html")).to eq({"SOISY-SOUS-MONTMORENCY" => "mairie@soisy-sous-montmorency.fr"})
  end
end

describe "get townhall urls method" do
  it "should return an array" do
    expect(get_townhall_urls("https://www.annuaire-des-mairies.com/val-d-oise.html").class).to eq(Array)
  end

  it "should return a non empty array" do
    expect(get_townhall_urls("https://www.annuaire-des-mairies.com/val-d-oise.html").length).to be > 0
  end

  it "should return an array filled with strings" do
    expect(get_townhall_urls("https://www.annuaire-des-mairies.com/val-d-oise.html")[0].class).to eq(String)
    expect(get_townhall_urls("https://www.annuaire-des-mairies.com/val-d-oise.html")[5].class).to eq(String)
    expect(get_townhall_urls("https://www.annuaire-des-mairies.com/val-d-oise.html")[10].class).to eq(String)
  end
end

# describe "collect townhalls names and emails" do
#   it "should return an array" do
#     expect(collect_townhalls_names_and_emails("https://www.annuaire-des-mairies.com/val-d-oise.html").class).to eq(Array)
#   end

#   it "should return a non empty array" do
#     expect(collect_townhalls_names_and_emails("https://www.annuaire-des-mairies.com/val-d-oise.html").length).to be > 0
#   end

#   it "should return an array filled with hashes" do
#     expect(collect_townhalls_names_and_emails("https://www.annuaire-des-mairies.com/val-d-oise.html")[0].class).to eq(Hash)
#     expect(collect_townhalls_names_and_emails("https://www.annuaire-des-mairies.com/val-d-oise.html")[5].class).to eq(Hash)
#     expect(collect_townhalls_names_and_emails("https://www.annuaire-des-mairies.com/val-d-oise.html")[10].class).to eq(Hash)
#   end
# end
