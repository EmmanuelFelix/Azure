az group create --name QuickstartAnsible-rg --location eastus2
az vm create --resource-group QuickstartAnsible-rg --name QuickstartAnsible-vm --image Ubuntu2204 --admin-username azureuser --admin-password 1q2w3e4r.-.-
az vm show -d -g QuickstartAnsible-rg -n QuickstartAnsible-vm --query publicIps -o tsv

az vm run-command invoke -g QuickstartAnsible-rg -n QuickstartAnsible-vm --command-id RunShellScript --scripts "sudo apt-get update && sudo apt install software-properties-common"
az vm run-command invoke -g QuickstartAnsible-rg -n QuickstartAnsible-vm --command-id RunShellScript --scripts "sudo add-apt-repository --yes --update ppa:ansible/ansible"
az vm run-command invoke -g QuickstartAnsible-rg -n QuickstartAnsible-vm --command-id RunShellScript --scripts "sudo apt install ansible"
az vm run-command invoke -g QuickstartAnsible-rg -n QuickstartAnsible-vm --command-id RunShellScript --scripts "ansible-galaxy collection install azure.azcollection --force"