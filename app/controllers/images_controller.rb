require 'image'
class ImagesController < ApplicationController
  def index
    puts 'Here we are';
  end

  def save
    puts 'Here we are at save';
    if params[:image_url]
      puts 'We are in the Save method of Welcome controller ' + params[:image_url];
      image = Image.new;
      image = Image.create(image_url: params[:image_url]);
      image.save;
      flash[:saved_image] = "The image was saved!";
      @data_item = image.image_url;

    end
  end

end
