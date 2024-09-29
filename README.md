# Proxy Reverso Nginx com SSL
Implementação de proxy reverso com Nginx e script para geração de certificado SSL desenvolvido utilizando Docker.

## ⚙️ Configuração de ambiente
Essas instruções permitirão que você configure um ambiente Ubuntu para publicação de projetos com certificação SSL (LetsEncrypt).
### 📋 Pré-requisitos
Recursos que devem estar instalados no ambiente
- Docker
- Docker Swarm
- Git
- DNS com acesso ao portal do provedor
- Ambiente Ubuntu

### 🔧 Instalação e preparação dos arquivos

1. Criação de pasta para armazenar os arquivos e acesso à pasta
```bash
mkdir nginx-proxy
cd nginx-proxy
```

<br/>

2. Clone do repositório com os arquivos
```git
git clone [Url deste repositório]
```

<br/>

3. Acesso à pasta do projeto clonado
```bash
cd nginx-proxy-ssl
```

<br/>

4. Alteração do arquvi de script
```bash
sudo nano config.sh
```
Altere o locai marcado com #DOMINIOS# para o domínio desejado

### 🔗 Configuração NGINX

A configuração de rotas do Nginx devem ser feitas no arquivo ```nginx.conf```. 
Nele existe um exemplo de configuração que deve ser adaptada ao conforme a necessidade. Acesse a [Documentação Nginx](https://nginx.org/en/docs/http/configuring_https_servers.html) para mais informações!

## 🛠️ Execução do script de configuração
Para executar o script de configuração use o seguinte comando:
```bash
sudo ./config.sh
```
Como a configuração gerará um certificado wildcard, será solicitado que seja adicionado um registro TXT no DNS para demonstrar que você tem acesso ao domínio informado. Isso deve ser configurado no portal do provedor de DNS e o novo registro deve ter as seguintes características:

- Nome: ```_acme-challenge.#dominio#``` (troque #dominio# pelo domínio que está sendo configurado)

- Valor: O valor do registro TXT deve ser o token fornecido pelo Certbot durante a execução do comando.

## 💻 Conclusão

Ao finalizar, caso não haja erros apresentado no terminal e caso a configuração de DNS seja feita corretamente, o proxy reverso estará configurado para uso por acesso externo através do domínio configurado. 

## 📖 Material de apoio
- [Nginx and Let’s Encrypt with Docker in Less Than 5 Minutes](https://pentacent.medium.com/nginx-and-lets-encrypt-with-docker-in-less-than-5-minutes-b4b8a60d3a71)
- [nginx documentation](https://nginx.org/en/docs/)
- [Docker Docs](https://docs.docker.com/)

## 📄 Referências
**Script desenvolvido com base no script apresentado neste repositório [nginx-certbot](https://github.com/wmnnd/nginx-certbot).**