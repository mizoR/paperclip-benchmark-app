require 'benchmark/ips'

namespace 'performance' do
  task 'test' => :environment do
    users = User.all.to_a

    Benchmark.ips do |x|
      x.config(time: 10)

      original = Paperclip::Interpolations
      alter    = Paperclip::AlterInterpolator.new

      x.report 'Original interpolator' do
        users.each do |user|
          user.avatar.instance_variable_set :@interpolator, original
          user.avatar.url
          user.avatar.url :large
          user.avatar.url :thumb
        end
      end

      x.report 'Alter interpolator' do
        users.each do |user|
          user.avatar.instance_variable_set :@interpolator, alter
          user.avatar.url
          user.avatar.url :large
          user.avatar.url :thumb
        end
      end
    end
  end
end
