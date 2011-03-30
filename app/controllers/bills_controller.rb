class BillsController < ApplicationController
  # GET /bills
  # GET /bills.xml
  def index
    @user = User.find(params[:user_id])
    @bills = @user.bills.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bills }
    end
  end

  # GET /bills/1
  # GET /bills/1.xml
  def show
    @user = User.find(params[:user_id])
    @bill = Bill.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bill }
    end
  end

  # GET /bills/new
  # GET /bills/new.xml
  def new
    @user = User.find(params[:user_id])
    @bill = @user.bills.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bill }
    end
  end

  # GET /bills/1/edit
  def edit
    @user = User.find(params[:user_id])
    @bill = Bill.find(params[:id])
  end

  # POST /bills
  # POST /bills.xml
  def create
    @user = User.find(params[:user_id])
    params[:bill][:user_id] = params[:user_id]
    @bill = Bill.new(params[:bill])

    respond_to do |format|
      if @bill.save
        format.html { redirect_to(user_bill_url(@user, @bill), :notice => 'Bill was successfully created.') }
        format.xml  { render :xml => @bill, :status => :created, :location => @bill }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bill.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bills/1
  # PUT /bills/1.xml
  def update
    @user = User.find(params[:user_id])
    @bill = Bill.find(params[:id])

    respond_to do |format|
      if @bill.update_attributes(params[:bill])
        format.html { redirect_to(@bill, :notice => 'Bill was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bill.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bills/1
  # DELETE /bills/1.xml
  def destroy
    @user = User.find(params[:user_id])
    @bill = Bill.find(params[:id])
    @bill.destroy

    respond_to do |format|
      format.html { redirect_to(user_bills_url(@user)) }
      format.xml  { head :ok }
    end
  end
end
