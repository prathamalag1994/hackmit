class ContractsController < ApplicationController
def new
	@projects = Project.all
end
def create
	
    @contract = Contract.new(contract_params)
    @contract.save
  if @contract.save
  	@contract.custid = current_user.id
  end
  @contract.save
  redirect_to @contract
end

def show
  @contract = Contract.find(params[:id])
end

private
  def contract_params
    params.require(:contract).permit(:custid, :projid, :tx, :back)
  end
end


