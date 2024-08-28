## Instalações
- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [AWS CLI](https://aws.amazon.com/pt/cli/)
- [Terraform - Providers](https://registry.terraform.io/browse/providers)
    - [AWS](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

## Criação ambiente
- AWS > IAM > Users > Add user > <terraform-aws> > (Acess type > Programmatic access)
    >Criar grupo com política AdministratorAccess (caso não o tenha) e atrelar ao novo usuário
- `aws configure` configurar AWS CLI
    - AWS Access Key ID: conforme o _.csv_ obtido no passo anterior
    - AWS Secret Access Key: conforme o _.csv_ obtido no passo anterior
    - Default region name = us-east-1
    - Default output format: json
- `ssh-keygen -f terraform-aws -t rsa` gerar chave SSH
    >Mover a chave privada e copiar a chave pública para um diretório padrão ou de sua escolha
    
    >AWS > EC2 > Key Pairs > Import Key Pair (chave pública criada anteriormente)

## Deploy
- `terraform init` iniciar/configurar diretório
- `terraform plan` planejamento do deploy
- `terraform apply` deploy planejamento

## Configurações
- [AWS Security Group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)
- `terraform show` listar detalhes do ambiente baseado no arquivo _terraform.tfstate_
- `aws ec2 describe-security-groups` listar security groups
>Para realização de SSH, selecionar um instância > Connect > (utilizar linha de comando exemplificada no terminal alterando o arquivo .pem para o diretório/arquivo em que se encontra a chave privada)