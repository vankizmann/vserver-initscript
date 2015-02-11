<h1>VSERVER Initscript</h1>
<h3>FTP</h3>
<p>Run the init.sh and these commands:</p>
<p><code>passwd web</code></p>
<p><code>sudo usermod -aG www-data web</code></p>
<h3>MySQL</h3>
<p>Set up the root password (default: password)</p>
<p><code>service mysql start</code></p>
<p><code>mysql -u root -p</code></p>
<p><code>mysql> use mysql;</code></p>
<p><code>mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;</code></p>
<p><code>mysql> UPDATE mysql.user SET Password=PASSWORD('new-password') WHERE User='root';</code></p>
<p><code>mysql> FLUSH PRIVILEGES;</code></p>
<p><code>mysql> quit;</code></p>
<p><code>service mysql reload</code></p>
<h3>Gitlab</h3>
<p><code>sudo gitlab-ctl reconfigure</code></p>
<p><code>sudo usermod -aG gitlab-www www-data</code></p>
<p>Username: root<br>Password: 5iveL!fe</p>
<h3>Teamspeak</h3>
<p>Restart server</p>
<p><code>passwd teamspeak</code></p>
<p><code>teamspeak start</code></p>
<h3>Done!</h3>

