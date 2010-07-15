class InvoicesController < ApplicationController
  unloadable
  skip_before_filter :load_project
  before_filter :load_invoice, :only => [:show, :preview, :edit, :update, :destroy]

  def index
    @invoices = Invoice.all
  end

  def show
  end

  def preview
    @comments = Comment.with_hours
    render :layout => 'print'
  end

  def new
    @invoice = Invoice.new_or_from(params[:from])
  end

  def edit
  end

  def create
    @invoice = Invoice.new(params[:invoice])

    if @invoice.save
      redirect_to invoice_url(@invoice)
    else
      render 'new'
    end
  end

  def update
    if @invoice.update_attributes(params[:invoice])
      redirect_to invoice_url(@invoice)
    else
      render 'edit'
    end
  end

  private

  def load_invoice
    @invoice = Invoice.find(params[:id])
  end
end
