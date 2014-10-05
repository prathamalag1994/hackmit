class ContractsController < ApplicationController
def new
	@projects = Project.all
end
def create
	
    @contract = Contract.new(contract_params)
    @contract.save
  if @contract.save
  	@contract.custid = current_user.id
  	@proj = Project.find(@contract.projid)
  	if @proj.min > @contract.back
  		@contract.destroy
  	else
    @proj.pl = @proj.pl + @contract.back
  	@proj.backed = @proj.backed + 1
  	@contract.save
  	@proj.save
  	redirect_to @contract
  	end
  end
  
end

def show
  @contract = Contract.find(params[:id])
end

private
  def contract_params
    params.require(:contract).permit(:custid, :projid, :tx, :back)
  end
end


