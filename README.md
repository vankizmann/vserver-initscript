<h1>VSERVER Initscript</h1>
<h3>FTP</h3>
<p>First run the init.sh and after run these commands:</p>
<p><code>passwd web</code></p>
<h3>MySQL</h3>
<p>Set up the root password (default: password)</p>
<p><code>mysql -u root -p</code></p>
<p><code>mysql> use mysql;</code></p>
<p><code>mmysql> UPDATE mysql.user SET Password=PASSWORD('new-password') WHERE User='root';</code></p>
<p><code>mFLUSH PRIVILEGES;<br>quit;</code></p>
<h3>More info:</h3>
<p>Comming soon!</p>
<p></p>
<p><b>Everything done!</b></p>