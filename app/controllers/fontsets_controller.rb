class FontsetsController < ApplicationController
  # GET /fontsets
  # GET /fontsets.json
  def index
    @fontsets = Fontset.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fontsets }
    end
  end

  # GET /fontsets/1
  # GET /fontsets/1.json
  def show
    @fontset = Fontset.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fontset }
    end
  end

  # GET /fontsets/new
  # GET /fontsets/new.json
  def new
    @fontset = Fontset.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fontset }
    end
  end

  # GET /fontsets/1/edit
  def edit
    @fontset = Fontset.find(params[:id])
  end

  # POST /fontsets
  # POST /fontsets.json
  def create
    @fontset = Fontset.new(params[:fontset])

    respond_to do |format|
      if @fontset.save
        format.html { redirect_to @fontset, notice: 'Fontset was successfully created.' }
        format.json { render json: @fontset, status: :created, location: @fontset }
      else
        format.html { render action: "new" }
        format.json { render json: @fontset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fontsets/1
  # PUT /fontsets/1.json
  def update
    @fontset = Fontset.find(params[:id])

    respond_to do |format|
      if @fontset.update_attributes(params[:fontset])
        format.html { redirect_to @fontset, notice: 'Fontset was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @fontset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fontsets/1
  # DELETE /fontsets/1.json
  def destroy
    @fontset = Fontset.find(params[:id])
    @fontset.destroy

    respond_to do |format|
      format.html { redirect_to fontsets_url }
      format.json { head :ok }
    end
  end
end
