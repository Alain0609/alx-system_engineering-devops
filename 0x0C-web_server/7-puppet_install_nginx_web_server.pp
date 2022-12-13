# Installs a Nginx web server

exec { 'nginx server':
  provider => shell,
  command  => 'sudo apt-get -y update; sudo apt-get -y install nginx; echo "Hello World!" > /var/www/html/index.nginx-debian.html; sudo sed -i "/server_name _;/a location /redirect_me {\\n\\treturn 301 https://github.com/belovetech;\\n\\t}\\n" /etc/nginx/sites-available/default; sudo service nginx restart',
}
