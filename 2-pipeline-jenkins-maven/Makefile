init:
	terraform12 init 

plan:
	terraform12 plan -out demo.tfplan 

apply:
	time terraform12 apply -auto-approve "demo.tfplan"

destroy:
	terraform12 destroy -auto-approve 

clean:
	rm -rf .terraform 
	rm -f demo.tfplan
	rm terraform.tfstate 
	rm terraform.tfstate.backup 
