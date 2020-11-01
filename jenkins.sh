#!/bin/bash

echo "admin" | sudo -S -s

docker build -t capstone:latest .

if [ ! -d "venv" ]
then
    python3 -m venv venv
fi

source venv/bin/activate
pip install -r requirements.txt
python test.py
