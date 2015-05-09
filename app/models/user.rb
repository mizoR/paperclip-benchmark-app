class User < ActiveRecord::Base
  has_attached_file :avatar,
    styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: "/images/:style/missing.png",
    url: "/system/:rails_env/:class/:attachment/:id/:hash.:extension",
    hash_secret: "785AFEE8C45E71086D262DB0B0A31442"

  validates_attachment_file_name :avatar,
    matches: [/png\Z/, /jpe?g\Z/]
end
