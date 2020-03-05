class EmailsController < ApplicationController
  def index
  	@emails = Email.all
  end

  def show
  	 @email = Email.find(params[:id])
  	 @email.update(read: true)

   	respond_to do |format|
			format.html {redirect_to email_path(@email.id)}
			format.js { }
		end
  end

  def create
  	@email = Email.create(
  		object: Faker::Book.title,
  		body: Faker::Lorem.paragraph
  		)

  	respond_to do |format|
  		format.html {redirect_to emails_path}
  		format.js { }
  	end
  end

  def update
  	@email.update(read: false)
  	redirect_to "root"
  end

  def edit
  end

  def destroy
  	@email = Email.find(params[:id])
  	@email.destroy

  	respond_to do |format|
			format.html {redirect_to emails_path}
			format.js { }
		end

  end



end
