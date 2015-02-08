<h1>VSERVER Initscript</h1>
<h3>FTP</h3>
<p>First run the init.sh and after run these commands:</p>
<p><code>passwd web</code></p>
<h3>MySQL</h3>
<p>Set up the root password (default: password)</p>
<p><code>mysql -u root -p</code></p>
<p><code>mysql> use mysql;</code></p>
<p><code>mysql> UPDATE mysql.user SET Password=PASSWORD('new-password') WHERE User='root';</code></p>
<p><code>mysql> GRANT ALL PRIVILEGES ON . TO 'root'@'%' WITH GRANT OPTION;</code></p>
<p><code>mysql> FLUSH PRIVILEGES;<br>quit;</code></p>
<h3>Gitlab</h3>
<p><code>sudo gitlab-ctl reconfigure</code></p>
<p>Username: root<br>Password: 5iveL!fe</p>