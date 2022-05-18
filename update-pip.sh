pip3 install --upgrade pip
pip3 freeze | awk -F "==" '{print $1}' > requirements.txt
echo Upgrading packages
pip3 install -r requirements.txt --upgrade
pip check