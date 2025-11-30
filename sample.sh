echo dowloading nginx
dnf module disable nginx -y
dnf module enable nginx:1.24 -y
dnf install nginx -y

echo downloading confi file
rm -rf /usr/share/nginx/html/*
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip

cp nginx.conf /etc/nginx/nginx.conf

echo unziping the file
cd /usr/share/nginx/html
unzip /tmp/frontend.zip

systemctl enable nginx
systemctl start nginx

systemctl restart nginx
