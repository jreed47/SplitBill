class LedgersController < ApplicationController
  # GET /ledgers
  # GET /ledgers.xml
  def index
    @item = Item.find(params[:item_id])
    @ledgers = @item.ledgers.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ledgers }
    end
  end

  # GET /ledgers/1
  # GET /ledgers/1.xml
  def show
    @item = Item.find(params[:item_id])
    @ledger = @item.ledgers.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ledger }
    end
  end

  # GET /ledgers/new
  # GET /ledgers/new.xml
  def new
    @item = Item.find(params[:item_id])
    @bill = @item.bill
    @ledger = @item.ledgers.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ledger }
    end
  end

  # GET /ledgers/1/edit
  def edit
    @item = Item.find(params[:item_id])
    @ledger = @item.ledgers.find(params[:id])
  end

  # POST /ledgers
  # POST /ledgers.xml
  def create
    @item = Item.find(params[:item_id])
    @ledger = @item.ledgers.build(params[:ledger])

    respond_to do |format|
      if @ledger.save
        format.html { redirect_to(item_path(@item), :notice => 'Ledger was successfully created.') }
        format.xml  { render :xml => @ledger, :status => :created, :location => @ledger }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ledger.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ledgers/1
  # PUT /ledgers/1.xml
  def update
    @item = Item.find(params[:item_id])

    @ledger = @item.ledgers.find(params[:id])

    respond_to do |format|
      if @ledger.update_attributes(params[:ledger])
        format.html { redirect_to([@item,@ledger], :notice => 'Ledger was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ledger.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ledgers/1
  # DELETE /ledgers/1.xml
  def destroy
    @item = Item.find(params[:item_id])

    @ledger = @item.ledgers.find(params[:id])
    @ledger.destroy

    respond_to do |format|
      format.html { redirect_to(@item) }
      format.xml  { head :ok }
    end
  end
end
