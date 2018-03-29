# Schema Framework Case Study

This incomplete README file is a placeholder, added for the initial construction of the repository.

The files and directory structure in this repository are mirrors of the files created in the
[Case Study](https://github.com/cjungmann/schemafw/blob/master/userguide/SchemaFWCaseStudy.md) found in
the [Schema Framework UserGuide](https://github.com/cjungmann/schemafw/blob/master/userguide/UserGuide.md).

After the Schema Framework is fully [prepared](https://github.com/cjungmann/schemafw/blob/master/userguide/PreparingToUseSchemaFW.md), download this repository, follow the instructions below (coming later),
and run the application.

## Installing the Case Study Application

### Server Assumptions

#### Operating System

This guide makes several assumptions about your system.  The first and most
important is that you are running a Linux server with Apache and MySQL installed.
We don't use PHP, so it technically doesn't have to be a full *LAMP* server, but
*LAMP* is a common installation that fulfills this assumption

#### Web-server Directories

We assume that
- Apache configuration files reside at */etc/apache2/sites-available*
- Web site directories are under */etc/www*.

In the instructions that follow, replace */etc/www* with your actual web site hosting directory,
and adjust the configuration target if your system doesn't use */etc/apache2/sites-available*.

### Download Repository to WWW Directory

Download and install the case study repository.  Do not forget to adjust the *DocumentRoot*
instruction in *casestudy/casestudy.conf* if your www directory is not at */etc/www*.

#### Download Using GIT

~~~sh
cd /etc/www/
sudo git https://github.com/cjungmann/sfw_casestudy.git casestudy
~~~

#### Download Zipped File

~~~sh
cd /etc/www/
sudo wget https://github.com/cjungmann/sfw_casestudy/archive/master.zip
sudo unzip -d casestudy master.zip
~~~

### Continue Case Study Setup

Assuming you're still in the */etc/www* directory and you have made already made any necessary
adjustments to the *casestudy.conf* file:

~~~sh
cd casestudy
sudo ln -s /usr/local/lib/schemafw/web_includes/ site/includes
sudo cp casestudy.conf /etc/apache2/sites-available/
sudo service apache2 restart
~~~

If you are running this on a workstation, you may need to add an entry to your */etc/hosts* file
like `127.0.0.1  casestudy` so you can point your browser at it.

### Test Case Study Site

Open a browser and enter the following URL:

`http://casestudy/`

and it should show you an HTML page with links to SchemaFW pages.

### Troubleshooting

If you get a "This site can't be reached" message, you will need to make sure that your
computer knows the appropriate IP address to use for the hostname you entered.  This is done
with DNS if you're accessing the program over the internet.  If you are running on localhost
(i.e. your workstation), you will need to add the entry in your */etc/hosts* file as
described above.

