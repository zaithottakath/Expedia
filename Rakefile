%w{ rubygems bundler find rake/testtask}.each { |lib| require lib }

task :default => :spec

Rake::TestTask.new(:spec) do |t|
  t.test_files = FileList['spec/*_spec.rb']
end

Rake::TestTask.new(:acceptance) do |t|
  t.test_files = FileList['*_acceptance.rb']
end
