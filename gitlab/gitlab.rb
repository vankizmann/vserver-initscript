# Define external url
external_url 'http://gitlab.vanki.de'
# Disable ngnix
nginx['enable'] = false
ci_nginx['enable'] = false
# Add www-data to gitla-www group
web_server['external_users'] = ['www-data']