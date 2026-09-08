#!/bin/bash
# =====================================================
# junji64.github.io 최초 배포 스크립트
# 실행 전: Git이 설치되어 있어야 합니다.
# =====================================================

set -e

REPO="junji64.github.io"
GITHUB_USER="junji64"
REMOTE="https://github.com/${GITHUB_USER}/${REPO}.git"

echo "======================================"
echo " junji64.github.io 배포 시작"
echo "======================================"

# 현재 디렉토리가 이미 git repo인지 확인
if [ ! -d ".git" ]; then
  echo "→ Git 저장소 초기화..."
  git init
  git remote add origin "$REMOTE"
else
  echo "→ 기존 Git 저장소 사용"
fi

# main 브랜치 설정
git checkout -B main

# 파일 추가
echo "→ 파일 스테이징..."
git add index.html sitemap.xml robots.txt .github/

# 커밋
echo "→ 커밋..."
git commit -m "Deploy: Ji Jun personal homepage $(date '+%Y-%m-%d %H:%M')"

# 푸시
echo "→ GitHub에 푸시..."
echo "   (GitHub 비밀번호 또는 Personal Access Token 입력이 필요할 수 있습니다)"
git push -u origin main --force

echo ""
echo "======================================"
echo " 배포 완료!"
echo " 1~3분 후 https://junji64.github.io 접속"
echo "======================================"
