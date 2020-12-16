Rake::Task['assets:precompile'].clear

namespace :assets do
  task 'precompile' do
    Rake::Task['webpacker:compile'].invoke
  end
end