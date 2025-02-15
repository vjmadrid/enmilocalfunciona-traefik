

# global redirect to https
- "traefik.http.routers.http-catchall.rule=hostregexp(`{host:.+}`)"
- "traefik.http.routers.http-catchall.entrypoints=web"
- "traefik.http.routers.http-catchall.middlewares=redirect-to-https"
# middleware redirect
- "traefik.http.middlewares.redirect-to-https.redirectscheme.scheme=https"


command
      - --accesslog=true
      - --accesslog.filePath=/logs/access.log