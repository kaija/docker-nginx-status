all: image

image:
	docker build -t kaija/nginx_status .
run:
	docker run -d -p 80:80 -p 8080:8080 kaija/nginx_status
run_exporter:
	docker run -d -p 9113:9113 fish/nginx-exporter -nginx.scrape_uri=http://10.1.200.44/nginx_status
