# Aubay Test
Teste GCP para vaga da Aubay


## Etapas do teste

#### 1. Criar um gcp project
Criado o projeto marcos-teste-aubay

#### 2. criar uma vm, como quiser e dar-me acesso a paulomonteiro1976@outlook.com
Criada a vm padrão com o tamanho "e2-small" e o nome de "Instance-1" os Debian na zona "us-east1-b", tageada com o "costcenter-aubay"

Além disso para gerar permissionamento dentro da GCP é necessário que o endereço de e-mail e o domínio estejam associados a uma conta ativa do Google, do Google Workspace ou do Cloud Identity.

Documento: compute-engine.tf

#### 3. criar um composer

Criado o composer com a tag "costcenter-aubay", Label "costcenter = aubay", na região "us-east-1" com o node count de 3 máquinas sendo o seu minimo

Documento: composer.tf

#### 3. criar 1 service Account e enviar-me json key

Criado a Service account, e ao rodar o arquvio da mesma, gera a service account em um documento json na pasta do terraform

Documento: iam.tf

#### 4. criar um secret, dar acesso a esta Service Account criada em 7 e ao meu user

Criado o secret e gerando acesso a service account criada anteriorment

Documento: secret.tf

#### 5. criar uma firestore com collection dummys

Criado o firestorm e usado o terraform para criar e popular o primeiro dado da collection

Documento: firstore.tf

#### 6. criar um databricks e dar-me acesso colocando -me no grupo admins

Criado o Databricks e realizado a inserção do usuário paulomonteiro1976@outlook.com de forma manual ao grupo dos admins

#### 7. criar um cluster em databricks, com paragem em 30 minutos, se nao estiver a ser usada, e usar spot instances/vm + colocar uma tag : costcenter= aubay

Criado o cluster e configurado via terraform através com as especificações acima.

Documento: databricks.tf

#### 8 - Importar os serviços criados manualmente de 2 a 6 e fazer novo deploy dos mesmos serviços, como nomes diferentes via terraform. Enviar o codigo e dar-me os acessos necessarios para validar.

### Considerações Finais

Para manter todos os recursos no ar ao mesmo tempo, seria necessário maior quota que uma conta free tier, dessa forma, realizei cada etapa e desliguei os serviços de forma a não gerar cobrança.