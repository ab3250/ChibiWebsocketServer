#!/usr/bin/env bash
git add .
git commit -m "$(date +"%Y_%m_%d_%I_%M_%p")"
git push -u ghub master
git push -u aws master


