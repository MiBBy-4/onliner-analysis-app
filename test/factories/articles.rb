FactoryBot.define do
  factory :article do
    title { Faker::Name.name }
    link { 'https://echo.msk.ru/news/2968524-echo.html' }
  end
end
