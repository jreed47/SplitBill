class ItemsController < ApplicationController

  # GET /items
  # GET /items.xml
  def index
    @bill = Bill.find(:id)
    @items = @bill.items.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @items }
    end
  end
  # GET /items/1
  # GET /items/1.xml
  def show
    @item = Item.find(params[:id])
    @bill = Bill.find(@item.bill_id)
    @user = User.find(@bill.user_id)

    @ledgers = Ledger.find_all_by_item_id(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/new
  # GET /items/new.xml
  def new
    @bill = Bill.find(params[:bill_id])
    @user = @bill.user
    @item = @bill.items.new

#    @user = User.find(@bill.user_id)
#    @item = Items.new

    respond_to do |format|
      format.html  # new.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
    @bill = @item.bill
    @user = @bill.user


#    @bill = Bill.find(@item.bill_id)
#    @user = User.find(@bill.user_id)
  end

  # POST /items
  # POST /items.xml
  def create
    #find the bill that the item belongs to
    @bill = Bill.find(params[:item][:bill_id])
    @user = @bill.user

    @item = @bill.items.build(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to(user_bill_path(@user,@bill), :notice => 'Item was successfully created.') }
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
    @bill = Bill.find(params[:item][:bill_id])
    @user = @bill.user
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
    @item = Item.find(params[:id])
    @bill = @item.bill
    @user = @bill.user
    @item.destroy

    respond_to do |format|
      format.html { redirect_to(user_bill_url(@user,@bill)) }
      format.xml  { head :ok }
    end
  end

end
