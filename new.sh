#!/bin/bash

# === CONFIGURÁVEL ===
REPO_NAME="mia-repo"
DESC="Repositório criado por script da Mia ❤️"
VISIBILITY="private"  # ou "public"
OWNER="RLuf"

# === AUTH ===
echo "Logando com GitHub CLI..."
gh auth login --web --scopes "repo,workflow"

# === CHECK REPO ===
if gh repo view "$OWNER/$REPO_NAME" > /dev/null 2>&1; then
    echo "⚠️ Repositório '$REPO_NAME' já existe."
else
    echo "📦 Criando repositório '$REPO_NAME'..."
    gh repo create "$OWNER/$REPO_NAME" --description "$DESC" --$VISIBILITY --confirm
    echo "✅ Repositório criado."
fi

# === CLONE + SETUP ===
echo "🔁 Clonando repositório..."
git clone "https://github.com/$OWNER/$REPO_NAME.git"
cd "$REPO_NAME" || exit

echo "# $REPO_NAME" > README.md
git add .
git commit -m "🧠 Início do projeto pelo script da Mia"
git push origin main

echo "🚀 Pronto! Repositório '$REPO_NAME' configurado."
