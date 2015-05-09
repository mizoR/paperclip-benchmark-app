require 'benchmark/ips'

namespace 'performance' do
  def puts_avatar(avatar: , interpolator:)
    avatar.instance_variable_set :@interpolator, interpolator
    puts interpolator_name(interpolator)
    puts avatar.url
    puts avatar.url :large
    puts avatar.url :thumb
    puts
  end

  def interpolator_name(interpolator)
    interpolator.is_a?(Module) ? interpolator.name : interpolator.class.name
  end

  task 'test' => :environment do
    users = User.all.to_a

    original = Paperclip::Interpolations
    alter    = Paperclip::AlterInterpolator.new

    puts_avatar avatar: users[0].avatar, interpolator: original
    puts_avatar avatar: users[0].avatar, interpolator: alter

    Benchmark.ips do |x|
      x.config(time: 10)

      x.report interpolator_name(original) do
        users.each do |user|
          user.avatar.instance_variable_set :@interpolator, original
          user.avatar.url
          user.avatar.url :large
          user.avatar.url :thumb
        end
      end

      x.report interpolator_name(alter) do
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
