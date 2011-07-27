class ReadsController < ApplicationController
  # GET /reads
  # GET /reads.xml
  def index
    @reads = Read.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reads }
    end
  end

  # GET /reads/1
  # GET /reads/1.xml
  def show
    @read = Read.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @read }
    end
  end

  # GET /reads/new
  # GET /reads/new.xml
  def new
    @read = Read.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @read }
    end
  end

  # GET /reads/1/edit
  def edit
    @read = Read.find(params[:id])
  end

  # POST /reads
  # POST /reads.xml
  def create
    @read = Read.new(params[:read])
    
    @read.word_count = @read.reading.scan(/[\w-]+/).size

    respond_to do |format|
      if @read.save
        format.html { redirect_to(@read, :notice => 'Read was successfully created.') }
        format.xml  { render :xml => @read, :status => :created, :location => @read }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @read.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reads/1
  # PUT /reads/1.xml
  def update
    @read = Read.find(params[:id])
    
    @read.word_count = @read.reading.scan(/[\w-]+/).size

    respond_to do |format|
      if @read.update_attributes(params[:read])
        format.html { redirect_to(@read, :notice => 'Read was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @read.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reads/1
  # DELETE /reads/1.xml
  def destroy
    @read = Read.find(params[:id])
    @read.destroy

    respond_to do |format|
      format.html { redirect_to(reads_url) }
      format.xml  { head :ok }
    end
  end
end
