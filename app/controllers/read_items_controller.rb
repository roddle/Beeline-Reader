class ReadItemsController < ApplicationController
  # GET /read_items
  # GET /read_items.xml
  def index
    @read_items = ReadItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @read_items }
    end
  end

  # GET /read_items/1
  # GET /read_items/1.xml
  def show
    @read_item = ReadItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @read_item }
    end
  end

  # GET /read_items/new
  # GET /read_items/new.xml
  def new
    @read_item = ReadItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @read_item }
    end
  end

  # GET /read_items/1/edit
  def edit
    @read_item = ReadItem.find(params[:id])
  end

  # POST /read_items
  # POST /read_items.xml
  def create
    @chart = current_chart
    beeline = Beeline.find(params[:beeline_id])
    @read_item = @chart.read_items.build(:beeline => beeline)

    respond_to do |format|
      if @read_item.save
        format.html { redirect_to(@read_item.chart, :notice => 'Read item was successfully created.') }
        format.xml  { render :xml => @read_item, :status => :created, :location => @read_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @read_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /read_items/1
  # PUT /read_items/1.xml
  def update
    @read_item = ReadItem.find(params[:id])

    respond_to do |format|
      if @read_item.update_attributes(params[:read_item])
        format.html { redirect_to(@read_item, :notice => 'Read item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @read_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /read_items/1
  # DELETE /read_items/1.xml
  def destroy
    @read_item = ReadItem.find(params[:id])
    @read_item.destroy

    respond_to do |format|
      format.html { redirect_to(read_items_url) }
      format.xml  { head :ok }
    end
  end
end
