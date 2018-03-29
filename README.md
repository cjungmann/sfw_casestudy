# Schema Framework Case Study

This incomplete README file is a placeholder, added for the initial construction of the repository.

The files and directory structure in this repository are mirrors of the files created in the
[Case Study](https://github.com/cjungmann/schemafw/blob/master/userguide/SchemaFWCaseStudy.md) found in
the [Schema Framework UserGuide](https://github.com/cjungmann/schemafw/blob/master/userguide/UserGuide.md).

After the Schema Framework is fully [prepared](https://github.com/cjungmann/schemafw/blob/master/userguide/PreparingToUseSchemaFW.md), download this repository, follow the instructions below (coming later),
and run the application.

## Server Assumptions

### Operating System

This guide makes several assumptions about your system.  The first and most
important is that you are running a Linux server with Apache and MySQL installed.
We don't use PHP, so it technically doesn't have to be a full *LAMP* server, but
*LAMP* is a common installation that fulfills this assumption.

### Web-server Directories

We assume that
- Apache web site configuration files reside at */etc/apache2/sites-available*, and
- Web site directories are under */etc/www*.

## Installing the Case Study Application

Download and install the case study repository.  Adjust the following `cd` instrutions to reflect
your actual configuration if you do not put your web sites under */etc/www*.

### Download and Extract the Application

using git:
~~~sh
cd /etc/www/
sudo git https://github.com/cjungmann/sfw_casestudy.git casestudy
~~~

without git:
~~~sh
cd /etc/www/
sudo wget https://github.com/cjungmann/sfw_casestudy/archive/master.zip
sudo unzip -d casestudy master.zip
~~~

### Finish Case Study Installation

If you are not using */etc/www* for web sites, you will need to edit the *casestudy.conf* file,
updating the *DocumentRoot* instruction to point to the *site* directory in your case study
installation.

~~~sh
cd casestudy
sudo ln -s /usr/local/lib/schemafw/web_includes/ site/includes
sudo cp casestudy.conf /etc/apache2/sites-available/
sudo service apache2 restart
~~~

If you are running this on a workstation, you may need to add an entry to your */etc/hosts* file
like `127.0.0.1  casestudy` so you can point your browser at it.

## Test Case Study Site

Open a browser and enter the following URL:

`http://casestudy/`

and it should show you an HTML page with links to SchemaFW pages.

### Troubleshooting

If you get a "This site can't be reached" message, you will need to make sure that your
computer knows the appropriate IP address to use for the hostname you entered.  This is done
with DNS if you're accessing the program over the internet.  If you are running on localhost
(i.e. your workstation), you will need to add the entry in your */etc/hosts* file as
described above.

