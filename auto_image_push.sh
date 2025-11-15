#!/bin/bash

cd "$(dirname "$0")"

# 查找 images 文件夹中所有变动
changes=$(git status --porcelain images)

if [ -n "$changes" ]; then
    git add images
    commit_msg="自动同步图片：$(date '+%Y-%m-%d %H:%M:%S')"
    git commit -m "$commit_msg"
    git push
    echo "已自动上传图片！"
else
    echo "没有发现新的图片。"
fi
