RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

FactoryBot::SyntaxRunner.class_eval do
  def file_fixture_path(path)
    Rails.root.join("spec/fixtures/files/#{path}")
  end
end
