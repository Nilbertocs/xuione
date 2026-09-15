#!/bin/bash
#
# XUI ONE - Instalador/Atualizador
# https://github.com/Nilbertocs/xuione
#
# Uso:
#   ./installxui.sh install 1.5.13
#   ./installxui.sh update 1.5.12
#
set -e

REPO_URL="https://github.com/Nilbertocs/xuione/releases/download/v1.5.13"
VALID_VERSIONS="1.5.5 1.5.12 1.5.13"

C_RESET="\033[0m"
C_GREEN="\033[1;32m"
C_RED="\033[1;31m"
C_CYAN="\033[1;36m"
C_YELLOW="\033[1;33m"

info()  { echo -e "${C_CYAN}[*]${C_RESET} $1"; }
ok()    { echo -e "${C_GREEN}[+]${C_RESET} $1"; }
warn()  { echo -e "${C_YELLOW}[!]${C_RESET} $1"; }
error() { echo -e "${C_RED}[!]${C_RESET} $1"; }

usage() {
    echo ""
    echo "Uso: $0 <install|update> <versao>"
    echo "Versoes disponiveis: $VALID_VERSIONS"
    echo ""
    echo "Exemplos:"
    echo "  $0 install 1.5.13"
    echo "  $0 update 1.5.12"
    echo ""
    exit 1
}

ACTION="$1"
VERSION="$2"

[ -z "$ACTION" ] && usage
[ -z "$VERSION" ] && usage

case " $VALID_VERSIONS " in
    *" $VERSION "*) ;;
    *) error "Versao invalida: $VERSION"; usage ;;
esac

case "$ACTION" in
    install)
        FILE="XUI_${VERSION}.zip"
        ENTRYPOINT="install"
        ACTION_LABEL="Instalacao"
        ;;
    update)
        FILE="XUI_${VERSION}_UPDATE.zip"
        ENTRYPOINT="update"
        ACTION_LABEL="Atualizacao"
        ;;
    *)
        error "Acao invalida: $ACTION"
        usage
        ;;
esac

if [ "$(id -u)" -ne 0 ]; then
    error "Este instalador precisa ser executado como root (use sudo)."
    exit 1
fi

URL="$REPO_URL/$FILE"
WORKDIR="/tmp/xuione-$$"

echo ""
echo -e "${C_CYAN}===============================================${C_RESET}"
echo -e "${C_CYAN}   Bem-vindo ao Instalador XUI ONE${C_RESET}"
echo -e "${C_CYAN}   $ACTION_LABEL - versao $VERSION${C_RESET}"
echo -e "${C_CYAN}   github.com/Nilbertocs/xuione${C_RESET}"
echo -e "${C_CYAN}===============================================${C_RESET}"
echo ""

if ! command -v unzip >/dev/null 2>&1; then
    info "Instalando dependencia: unzip..."
    apt update -y >/dev/null && apt install -y unzip >/dev/null
fi

mkdir -p "$WORKDIR"
cd "$WORKDIR"

info "Baixando pacote XUI $VERSION ($ACTION)..."
wget --quiet --show-progress --progress=bar:force:noscroll "$URL" -O "$FILE"

if [ ! -f "$FILE" ]; then
    error "Falha no download. Abortando."
    exit 1
fi

echo ""
info "Extraindo arquivos..."
unzip -oq "$FILE" || { error "Falha na extracao!"; exit 1; }

info "Limpando pacote baixado..."
rm -f "$FILE"

info "Ajustando permissoes..."
chmod +x "$ENTRYPOINT"

ok "Iniciando $ACTION_LABEL do XUI $VERSION..."
echo ""
./"$ENTRYPOINT"
