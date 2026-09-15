# XUI One

Instruções de instalação e atualização do painel XUI (build adaptado 22.04-24.04).

Os arquivos estão hospedados como [Releases](https://github.com/Nilbertocs/xuione/releases) deste repositório (tag `v1.5.13`).

## Instalação rápida (recomendado)

Baixe o instalador uma vez e use-o para instalar ou atualizar qualquer versão disponível (`1.5.5`, `1.5.12`, `1.5.13`):

```bash
wget -qO installxui.sh https://raw.githubusercontent.com/Nilbertocs/xuione/main/installxui.sh ; chmod +x installxui.sh ; sudo ./installxui.sh
```

Menu interativo:

```bash
sudo ./installxui.sh
```

Executar por parâmetro:

```bash
sudo ./installxui.sh install 1.5.13
sudo ./installxui.sh update 1.5.13
```

O script baixa o pacote certo direto desta release, extrai, ajusta as permissões e executa o `install`/`update` automaticamente. Precisa ser executado como root. Tanto o `install` quanto o `update` vão pedir a chave de licença durante a execução.

## Licença

A chave de licença é emitida pela [NNetwork](https://portal.nnetwork.net/), revendedora credenciada do XUI. Acesse o portal para gerar/consultar sua licença antes de instalar ou atualizar.

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
