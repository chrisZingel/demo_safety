# README

To set up the application:

Run the following code to install the bundled gems and yarn to install the JavaScript dependencies in package.json:

The Postgre database is initialized unless it already exists:

```
bin\setup
```
The esbuild and Tailwind are run in separate processes using Foreman along with the web server. This is specified in the Procfile.dev:

```
bin\dev
```
To process the videos, I have used:

```
brew install ffmpeg
```

The setup up default records . There are two 
users staff@safetyhub and admin@safetyhub. They both have the
password  as password. 
```
rake db:seed
```
In hindsight, I should have done this using Docker since it seems to install a number of other packages
