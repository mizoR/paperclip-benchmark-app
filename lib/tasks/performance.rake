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
    custom    = Paperclip::CustomInterpolator.new

    puts_avatar avatar: users[0].avatar, interpolator: original
    puts_avatar avatar: users[0].avatar, interpolator: custom

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

      x.report interpolator_name(custom) do
        users.each do |user|
          user.avatar.instance_variable_set :@interpolator, custom
          user.avatar.url
          user.avatar.url :large
          user.avatar.url :thumb
        end
      end
    end
  end
end
