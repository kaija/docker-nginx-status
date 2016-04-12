all: image

.PHONY: nginx nginx_exporter
image:
	docker build -t kaija/nginx_status .
nginx:
	docker run -d -p 80:80 -p 8080:8080 --name nginx kaija/nginx_status
nginx_exporter:
	docker run -d -p 9113:9113 --name nginx-exporter fish/nginx-exporter -nginx.scrape_uri=http://10.211.55.43:8080/nginx_status

stop_nginx:
	docker stop nginx
	docker rm nginx
stop_nginx_exporter:
	docker stop nginx-exporter
	docker rm nginx-exporter
