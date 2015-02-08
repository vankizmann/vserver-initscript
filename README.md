<h1>VSERVER Initscript</h1>
<p>First run the init.sh and after run these commands:</p>
<p><code>passwd web</code></p>
<p>Set up the root password (default: password)<br><code>mysql -u root -p<br>mysql> use mysql;<br>mysql> UPDATE mysql.user SET Password=PASSWORD('new-password') WHERE User='root';<br>FLUSH PRIVILEGES;<br>quit;</code></p>
<p>Everything done!</p>