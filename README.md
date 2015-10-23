# Schedulr
[![Build Status](https://travis-ci.org/tiy-austin-ror/Schedlr.svg)](https://travis-ci.org/tiy-austin-ror/Schedlr)
[![Code Climate](https://codeclimate.com/github/tiy-austin-ror/Schedlr/badges/gpa.svg)](https://codeclimate.com/github/tiy-austin-ror/Schedlr)
[![Test Coverage](https://codeclimate.com/github/tiy-austin-ror/Schedlr/badges/coverage.svg)](https://codeclimate.com/github/tiy-austin-ror/Schedlr/coverage)

## Description


## Steps to get working locally

  - Clone
  - Bundle Install
  - If the project already has migrations
    - Run `rake db:setup`
  - If the project is brand new
    - Run `rake db:create`

## Steps to deploy

### Steps to deploy - Heroku
Assumption: you have a Heroku account and your code is committed to the Git repo from which you plan to push. From the command line in your project's root directory:

	- `heroku create` + your projectname
	- `git push heroku master`
	- `heroku run rake db:migrate`
	- `heroku run rake db:seed`
	- `git push heroku master` (repeated in what might seem to be perpetuity)

### Steps to deploy - AWS

#### Assumption: clean code is ready to be pushed from a Git repo.

	- Open an AWS account. After opening your account, you must generate Security Credentials from the <your name> dropdown in the Main Dashboard:
		- `AWS_ACCESS_KEY_ID`
		- `AWS_SECRET_ACCESS_KEY`
	(you may either download these keys from the AWS Dashboard GUI or copy them to a safe, permanent storage place. Either way, *keep these keys*, as the secret key will *never* again be visible in Dashboard after terminating the session during which it was created.)

	- Overwrite your existing Python installation (the version that ships with Mac OS) by running `brew install python`. This step will also install Pip, the package manager we will be using to install the tools we'll be using.

	- Install the virtual environment that will hold the AWS Command Line Interface (CLI) by running `pip install virtualenv`

	- Install the CLI in a virtualenv

		Normally, one would simply run `sudo pip install awsebcli` to install the CLI.

		But, thanks to a known bug in the AWS CLI running in conjunction with MacOS 10.10, that won't work for us. However, an enterprising Amazon engineer published a workaround in one of the AWS fora (https://forums.aws.amazon.com/thread.jspa?messageID=580745)

		Instead, copy and past this code into the command line of your HOME directory:

			`virtualenv ~/ebenv
			 source ~/ebenv/bin/activate
			 pip install awsebcli          
			 deactivate
			 sudo ln -s ~/ebenv/bin/eb /usr/local/bin/`

		If you run each of these lines manually (which will work), be certain NOT to run the `pip install awsebcli` as sudo. Doing so will lock all non-superusers out of SSH, and will therefore make these users unable to update code....

#### At this point, setup is complete and you are ready to initialize your server and prepare your code for deployment.

	- To start the server, do `eb init` (just as you would do a `git init`)

		Once the server has been initialized, you will be presented with a series of prompts:

		- select server region (default is OK)
		- provide your `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`
		- create a new application
		- give the new application a name (The default application name is the name of the folder in which you run `eb init`.)
		- specify the platform: Ruby version 2.2/Puma
		- choose "yes" to assign a SSH keypair to the environment (NOTE: this step is ESSENTIAL, as SSH is the means by which we interact with the server, troubleshoot, and push code.) Select a keypair as prompted.

#### Next, we need to add the Git extensions and create an entry in .gitignore:

		- from the project root directory, do `git commit -am "updated .gitignore"`
		- `git add . && commit -m "your notes"`

##### ...and deploy

	- from the project root directory, do `eb create rails-beanstalk-env`

		This command will build:

		- an Amazon S3 bucket to store environment data
		- a load balancer to distribute traffic to the web server(s)
		- a security group to allow incoming web traffic
		- an Auto Scaling group to adjust the number of servers in response to load changes
		- Amazon CloudWatch alarms that notify the Auto Scaling group when load is low or high
		- an Amazon EC2 instance hosting our application

#### The project is now deployed

		 - run `eb open` to start the server
		 - the browser *will* open with a 502 error. To get the application working, we need to configure a few environment variables. First is SECRET_KEY_BASE, which lives in config/secrets.yml.
		 - run `eb setenv SECRET_KEY_BASE=usethecharactersofyourchoicehere` to set this variable.
		 - The CLI automatically restarts the web server whenever you update configuration or deploy new code. Try loading the site again: `eb open`:
...You will receive a 404 error: don't sweat it. We aren't quite finished.

		- To be able to view our project, we need to set our `RACK_ENV` to `development`. To do this, do `eb setenv RACK_ENV=development`.
		- Do `eb open` to reload the site.

		You'll see:

			`$ eb open
			Ruby on Rails: Welcome aboard
			...`

		...and that's all, folks

Simply put, AWS is for finished production code. It's NOT a developer tool. In my next installment, I'll discuss the use of SSH to pull code updates from  Git. (The `eb deploy` command of the CLI is iffy, at best.)

## Notable tech used
