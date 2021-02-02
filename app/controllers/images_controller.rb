require 'image'

class ImagesController < ApplicationController
  def index
    if params[:tag_name]
      tag = params[:tag_name]
      puts 'Searching images with tag... ' + tag
      @search_results = Image.tagged_with(tag).to_a.sort_by{ |a| a[:id] }.reverse
      @search_tag = tag
    end
    @all_images = Image.all.to_a.sort_by{ |a| a[:id] }.reverse
  end

  def save
    if params[:image_url]
      puts 'Saving the image URL... ' + params[:image_url];
      image = Image.new;
      image = Image.create(image_url: params[:image_url]);
      image.tag_list.add(params[:tag], parse: true);
      image.save;
      flash[:saved_image] = "The image was saved!";

      @data_item = image;
    end
  end

  def delete
    if params[:image_id]
      Image.delete(params[:image_id]);
      flash[:deleted_image] = "The image with ID " + params[:image_id] + " was deleted!";
      redirect_to({:action=>'index'});
    end
  end

  def image_params
    params.require(:image_url).permit(:image_url, :tag_list);
  end
end
