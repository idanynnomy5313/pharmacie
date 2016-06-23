class AttachmentController < ApplicationController
  def show
  	@attachment = Attachment.find(params[:id])
  	send_data @attachment.data, :filename => @attachment.filename, :type => @attachment.content_type
  end
end
