# Define external url
external_url 'http://gitlab.vanki.de'
# Email
gitlab_rails['gitlab_email_from'] = 'gitlab@vanki.de'
# Disable signup
gitlab_rails['gitlab_signup_enabled'] = false
gitlab_rails['gitlab_signin_enabled'] = true
# Defualt user
user['username'] = "kizmann"
user['git_user_name'] = "Eduard Kizmann"
user['git_user_email'] = "gitlab@vanki.de"
# Disable ngnix
nginx['enable'] = false
ci_nginx['enable'] = false
# Add www-data to gitla-www group
web_server['external_users'] = ['www-data']