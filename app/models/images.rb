require 'carrierwave/datamapper'

class ImageUploader < CarrierWave::Uploader::Base

storage :file
end

class Image
  include DataMapper::Resource

  property :id, Serial

  mount_uploader :image, ImageUploader
end