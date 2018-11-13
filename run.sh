ps -ef | grep LichKin-ADMIN | grep -v grep | cut -c 9-15 | xargs kill -s 9

cd /opt/runnings/lichkin-projects-admin-launcher/
nohup java org.springframework.boot.loader.JarLauncher --spring.profiles.active=production --server.servlet.context-path=/ADMIN --server.port=28888 --log.tag=LichKin-ADMIN --log.level.system=debug --log.level.org=info --log.level.net=info --lichkin.locale.default=zh_CN --lichkin.locale.implemented=zh_CN --lichkin.system.tag=LichKin-ADMIN --lichkin.system.name=管理平台 --lichkin.system.debug=false --lichkin.web.debug=false --lichkin.web.admin.debug=false --lichkin.web.compress=true >/dev/null 2>&1 &

tail -f /lichkin-logs/LichKin-ADMIN.debug.log
