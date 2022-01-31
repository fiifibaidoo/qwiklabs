sudo apt-get update -y

sudo apt-get install apache2 php7.0 -y

sudo service apache2 restart

curl -sSO https://dl.google.com/cloudagents/add-monitoring-agent-repo.sh
sudo bash add-monitoring-agent-repo.sh
sudo apt-get update -y
sudo apt-get install stackdriver-agent -y

curl -sSO https://dl.google.com/cloudagents/add-logging-agent-repo.sh
sudo bash add-logging-agent-repo.sh
sudo apt-get update -y
sudo apt-get install google-fluentd -y