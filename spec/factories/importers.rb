FactoryBot.define do
  factory :importer, class: 'Importer' do
    state { Importer.states.keys.sample }

    trait :with_file do
      after(:create) do |importer|
        file = ActionDispatch::Http::UploadedFile.new({
                                                        filename: Faker::File.file_name(ext: 'txt', dir: '',
                                                                                        directory_separator: ''),
                                                        type: 'text/plain',
                                                        tempfile: file_fixture_path('CNAB.txt')
                                                      })

        importer.file.attach(file)
        importer.save
      end
    end
  end
end
