class ItemsController < ApplicationController

  # GET /items
  # GET /items.xml
  def index
    @bill = Bill.find(params[:bill_id])
    @user = User.find(@bill.user_id)
    @items = @bill.items.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @items }
    end
  end
  # GET /items/1
  # GET /items/1.xml
  def show
    @bill = Bill.find(params[:bill_id])
    @user = User.find(@bill.user_id)
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/new
  # GET /items/new.xml
  def new
    @bill = Bill.find(params[:bill_id])
    @user = User.find(@bill.user_id)
    @item = Item.new

    respond_to do |format|
      format.html  # new.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/1/edit
  def edit
    @bill = Bill.find(params[:bill_id])
    @user = User.find(@bill.user_id)
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.xml
  def create
    @bill = Bill.find(params[:bill_id])
    params[:item][:bill_id] = @bill
    @user = User.find(@bill.user_id)
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to(@item, :notice => 'Item was successfully created.') }
        format.xml  { render :xml => @item, :status => :created, :location => @item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.xml
  def update
    @bill = Bill.find(params[:bill_id])
    @user = User.find(@bill.user_id)
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to(@item, :notice => 'Item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.xml
  def destroy
    @bill = Bill.find(params[:bill_id])
    @user = User.find(@bill.user_id)
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to(items_url) }
      format.xml  { head :ok }
    end
  end
end
