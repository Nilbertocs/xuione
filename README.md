# XUI One

Instruções de instalação e atualização do painel XUI (build adaptado 22.04-24.04).

Os arquivos estão hospedados como [Releases](https://github.com/Nilbertocs/xuione/releases) deste repositório (tag `v1.5.13`).

## Instalação rápida (recomendado)

Baixe o instalador uma vez e use-o para instalar ou atualizar qualquer versão disponível (`1.5.5`, `1.5.12`, `1.5.13`):

```bash
wget -qO installxui.sh https://raw.githubusercontent.com/Nilbertocs/xuione/main/installxui.sh ; chmod +x installxui.sh
```

Instalar:

```bash
sudo ./installxui.sh install 1.5.13
```

Atualizar:

```bash
sudo ./installxui.sh update 1.5.13
```

O script baixa o pacote certo direto desta release, extrai, ajusta as permissões e executa o `install`/`update` automaticamente. Precisa ser executado como root.

## Pré-requisitos: instalar MariaDB 10.5.xx

```bash
sudo apt update ; apt-get install software-properties-common dirmngr -y ; sudo apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc' ; sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://mirror.lstn.net/mariadb/repo/10.5/ubuntu focal main' ; sudo apt-get install mariadb-server=1:10.5.27+maria~ubu2004 mariadb-client=1:10.5.27+maria~ubu2004
```

Bloquear a versão do MariaDB (evita upgrade automático quebrar o painel):

```bash
apt-mark hold maria*
```

## Instalação manual por versão (alternativa)

### XUI 1.5.5

```bash
wget "https://github.com/Nilbertocs/xuione/releases/download/v1.5.13/XUI_1.5.5.zip" -O /tmp/XUI_1.5.5.zip ; cd /tmp ; apt update ; apt install zip unzip -y ; unzip -o XUI_1.5.5.zip ; chmod +x install ; ./install
```

### XUI 1.5.12 (Beta)

```bash
wget "https://github.com/Nilbertocs/xuione/releases/download/v1.5.13/XUI_1.5.12.zip" -O /tmp/XUI_1.5.12.zip ; cd /tmp ; apt update ; apt install zip unzip -y ; unzip -o XUI_1.5.12.zip ; chmod +x install ; ./install
```

### XUI 1.5.13

```bash
wget "https://github.com/Nilbertocs/xuione/releases/download/v1.5.13/XUI_1.5.13.zip" -O /tmp/XUI_1.5.13.zip ; cd /tmp ; apt update ; apt install zip unzip -y ; unzip -o XUI_1.5.13.zip ; chmod +x install ; ./install
```

## Atualização manual por versão (alternativa)

### Atualizar para XUI 1.5.5

```bash
wget "https://github.com/Nilbertocs/xuione/releases/download/v1.5.13/XUI_1.5.5_UPDATE.zip" -O /tmp/XUI_1.5.5_UPDATE.zip ; cd /tmp ; unzip -o XUI_1.5.5_UPDATE.zip ; chmod +x update ; ./update
```

### Atualizar para XUI 1.5.12

```bash
wget "https://github.com/Nilbertocs/xuione/releases/download/v1.5.13/XUI_1.5.12_UPDATE.zip" -O /tmp/XUI_1.5.12_UPDATE.zip ; cd /tmp ; unzip -o XUI_1.5.12_UPDATE.zip ; chmod +x update ; ./update
```

### Atualizar para XUI 1.5.13

```bash
wget "https://github.com/Nilbertocs/xuione/releases/download/v1.5.13/XUI_1.5.13_UPDATE.zip" -O /tmp/XUI_1.5.13_UPDATE.zip ; cd /tmp ; unzip -o XUI_1.5.13_UPDATE.zip ; chmod +x update ; ./update
```

## Licença

```bash
wget https://scripts.nnetwork.net/xui/licence.sh ; chmod -R 777 licence.sh ; ./licence.sh
```

## Dicas para manter o painel estável e com bom desempenho

Parar o painel:

```bash
/home/xui/service stop
```

Iniciar o painel:

```bash
/home/xui/service start
```

Status / atualizar banco de dados:

```bash
/home/xui/status
```

Ferramentas:

```bash
/home/xui/tools
```

Gerar código de resgate:

```bash
/home/xui/tools rescue
```
