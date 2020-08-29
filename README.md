#  [WeHelp](https://github.com/ars-kalinichenko/WeHelp/releases) &middot;[![GitHub license](https://img.shields.io/github/license/ars-kalinichenko/WeHelp?color=success&label=License)](https://github.com/ars-kalinichenko/WeHelp/blob/master/LICENSE.md) [![GitHub release](https://img.shields.io/github/downloads/ars-kalinichenko/WeHelp/total?color=success&label=downloads)](https://github.com/ars-kalinichenko/WeHelp/releases) [![Project Language](https://img.shields.io/github/languages/top/ars-kalinichenko/WeHelp)](https://github.com/ars-kalinichenko/WeHelp)

## About project:

🙋🏻  A mobile application written for android is designed to help people find like-minded people and get answers to their questions.

## Screenshots:
Welcome page | Home page | Search page (questions)
:-------------------------:|:-------------------------:|:-------------------------:
![Welcome](https://github.com/ars-kalinichenko/WeHelp/blob/master/readme_images/screenshot_1.jpg?raw=true)  |  ![Home](https://github.com/ars-kalinichenko/WeHelp/blob/master/readme_images/screenshot_2.jpg?raw=true) | ![Search](https://github.com/ars-kalinichenko/WeHelp/blob/master/readme_images/screenshot_3.jpg?raw=true)

Search page (users) | Search page (posts) | Profile page
:-------------------------:|:-------------------------:|:-------------------------:
![Search](https://github.com/ars-kalinichenko/WeHelp/blob/master/readme_images/screenshot_6.jpg?raw=true)  |  ![Search](https://github.com/ars-kalinichenko/WeHelp/blob/master/readme_images/screenshot_5.jpg?raw=true) | ![Profile](https://github.com/ars-kalinichenko/WeHelp/blob/master/readme_images/screenshot_4.jpg?raw=true)

## Architectural diagram:

Backend:

![back diagram](https://github.com/ars-kalinichenko/WeHelp/blob/master/readme_images/arch_diagram_back.png?raw=true)

Frontend:

![web diagram](https://github.com/ars-kalinichenko/WeHelp/blob/master/readme_images/architectural_diagram_web.png?raw=true)

## Install on Android Device:

You can install the latest version of the application by going to releases: [https://github.com/ars-kalinichenko/WeHelp/releases](https://github.com/ars-kalinichenko/WeHelp/releases)

If you have a 32 bit processor architecture, then choose app-armeabi-v7a (almost all arm devices support this target), if 64 bit - app-arm64-v8a.

## Dependencies for mobile app:

```yaml
cupertino_icons: ^0.1.3 # for icons
simple_animations: ^2.2.1 # for toast animations
shared_preferences: ^0.5.8 # for save login data
provider: ^4.3.2 # for transfer data between registration screens
http: ^0.12.2 # for server calls
random_color: 1.0.5 # for changing colors in human preview, article
mask_text_input_formatter: ^1.0.7 # for phone mask
```

## How run app in Android Studio:

### Clone repository:

```bash
git clone https://github.com/ars-kalinichenko/WeHelp.git
```

### Install Flutter and Dart SDK:

- Install Flutter and Dart plugins: [https://flutter.dev/docs/get-started/editor](https://flutter.dev/docs/get-started/editor)
- Download Flutter SDK: [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)
- Set up path to SDK in Settings→Languages → Flutter SDK path

### Create configuration:

- Path to dart entrypoint: lib/main.dart
- Run main.dart

## How to join our API:

You can use the api at this link: [http://wehelp-apiserver-stage.us.aldryn.io/](http://wehelp-apiserver-stage.us.aldryn.io/)

## How run server on local machine:

1. Clone repo: [https://github.com/iCatOK/weHelpDemo](https://github.com/iCatOK/weHelpDemo)

    ```bash
    git clone https://github.com/iCatOK/weHelpDemo
    ```

2. Install and run Docker, official tutorials:  [https://docs.docker.com/get-docker/](https://docs.docker.com/get-docker/) .
3. Install docker-compose, tutorials [https://docs.docker.com/compose/install/](https://docs.docker.com/compose/install/)
4. In cloned project directory run:

    ```bash
    docker-compose up
    ```

    After finish last lines should be like below:

    ```bash
    web_1    | Starting ASGI/Channels version 2.4.0 development server at http://0.0.0.0:80/
    web_1    | Quit the server with CONTROL-C.
    web_1    | HTTP/2 support not enabled (install the http2 and tls Twisted extras)
    web_1    | Configuring endpoint tcp:port=80:interface=0.0.0.0
    web_1    | Listening on TCP address 0.0.0.0:80
    ```

    Stop running the server.

5. Next, run:

    ```bash
    docker-compose run web python manage.py migrate
    ```

    After finishing last lines will look like below:

    ```bash
      Applying api.0021_user_lol... OK
      Applying api.0022_auto_20200823_1553... OK
      Applying api.0023_auto_20200824_1427... OK
      Applying api.0024_auto_20200825_0849... OK
      Applying authtoken.0001_initial... OK
      Applying authtoken.0002_auto_20160226_1747... OK
      Applying chat.0001_initial... OK
      Applying sessions.0001_initial... OK
      Applying sites.0001_initial... OK
      Applying sites.0002_alter_domain_unique... OK
      Applying socialaccount.0001_initial... OK
      Applying socialaccount.0002_token_max_lengths... OK
      Applying socialaccount.0003_extra_data_default_dict... OK
    ```

6. Finally, run:

    ```bash
    docker-compose up
    ```

    You will see response like this, if that's it, so it worked correctly:

    ```bash
    web_1    | Performing system checks...
    web_1    |
    web_1    | System check identified some issues:
    web_1    |
    web_1    | WARNINGS:
    web_1    | ?: (urls.W005) URL namespace 'admin' isn't unique. You may not be able to reverse all URLs in this namespace
    web_1    |
    web_1    | System check identified 1 issue (0 silenced).
    web_1    | August 25, 2020 - 05:50:10
    web_1    | Django version 2.2.15, using settings 'settings'
    web_1    | Starting ASGI/Channels version 2.4.0 development server at http://0.0.0.0:80/
    web_1    | Quit the server with CONTROL-C.
    ```

    Next open the 127.0.0.1:8000 address in your browser and you will see page like this:

    ![Divio](https://github.com/ars-kalinichenko/WeHelp/blob/master/readme_images/1%20-%20%D0%B1%D1%80%D0%B0%D1%83%D0%B7%D0%B5%D1%80%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BF%D0%BE%D0%B4%D0%BD%D1%8F%D1%82%D0%B8%D1%8F%20%D1%81%D0%B5%D1%80%D0%B2%D0%B0.png?raw=true)

8. To test setup a Postman Desktop: [https://www.postman.com/](https://www.postman.com/)

You should see application's start window (emptier unlike it) after log in:

![Postman](https://github.com/ars-kalinichenko/WeHelp/blob/master/readme_images/2%20-%20Postman%2C%20%D0%BF%D1%80%D0%B8%D0%B2%D0%B5%D1%82%D1%81%D1%82%D0%B2%D0%B5%D0%BD%D0%BD%D0%BE%D0%B5%20%D0%BE%D0%BA%D0%BD%D0%BE%20%D0%BF%D1%80%D0%B8%D0%BB%D0%BE%D0%B6%D0%B5%D0%BD%D0%B8%D1%8F.png?raw=true)

In grey textbox write the address **127.0.0.1:8000/auth/registration/ (*especially with final slash*)** choose POST request in left menu. Type body of registration request like in picture:

![Response body](https://github.com/ars-kalinichenko/WeHelp/blob/master/readme_images/3%20-%20%D1%80%D0%B5%D0%B3%D0%B8%D1%81%D1%82%D1%80%D0%B0%D1%86%D0%B8%D1%8F%2C%20%D0%BF%D1%80%D0%B8%D0%BC%D0%B5%D1%80%20%D0%B7%D0%B0%D0%BF%D1%80%D0%BE%D1%81%D0%B0%20%D0%B8%20%D1%82%D0%B5%D0%BB%D0%BE%20%D0%B7%D0%B0%D0%BF%D1%80%D0%BE%D1%81%D0%B0.png?raw=true)

In headers set key-value

```bash
Content-Type: application-json
```

In postman it should be like that:

![Post postman](https://github.com/ars-kalinichenko/WeHelp/blob/master/readme_images/4%20-%20%D1%80%D0%B5%D0%B3%D0%B8%D1%81%D1%82%D1%80%D0%B0%D1%86%D0%B8%D1%8F%2C%20%D0%BF%D1%80%D0%B8%D0%BC%D0%B5%D1%80%20%D1%85%D0%B5%D0%B4%D0%B5%D1%80%D0%B0.png?raw=true)

After that click to **Send** button. You will see response like that:

Request body | Key
:-------------------------:|:-------------------------:
![Postman](https://github.com/ars-kalinichenko/WeHelp/blob/master/readme_images/7%20-%20After%20that%20click%20to%20Send%20button.%20You%20will%20see%20response%20like%20that%20(1).png?raw=true)  |  ![Key](https://github.com/ars-kalinichenko/WeHelp/blob/master/readme_images/8%20-%20After%20that%20click%20to%20Send%20button.%20You%20will%20see%20response%20like%20that%20(2).png?raw=true)

Add this token in header like that:

![Token](https://github.com/ars-kalinichenko/WeHelp/blob/master/readme_images/9%20-%20Add%20this%20token%20in%20header%20like%20that.png?raw=true)

And to add your first question change body and address (127.0.0.1:8000/api/questions/ method: POST) like in picture bellow. Make sure that you have headers like in above picture:

![Example](https://github.com/ars-kalinichenko/WeHelp/blob/master/readme_images/10%20-%20And%20to%20add%20your%20first%20question%20change%20body%20and%20address%20like%20in%20picture%20bellow.%20Make%20sure%20that%20you%20have%20headers%20like%20in%20above%20picture.png?raw=true)

After clicking send you'll see response like this:

![Returned body](https://github.com/ars-kalinichenko/WeHelp/blob/master/readme_images/11%20-%20After%20clicking%20send%20you'll%20see%20response%20like%20this.png?raw=true)

To make sure that your question is in the global list of all questions make GET request without body to 127.0.0.1:8000/api/questions/ :

![Get request](https://github.com/ars-kalinichenko/WeHelp/blob/master/readme_images/12%20-%20To%20make%20sure%20that%20your%20question%20is%20in%20the%20global%20list%20of%20all%20questions%20make%20GET%20request%20without%20body.png?raw=true)

## Backend project dependencies

```bash
# weHelp dependencies
dj-rest-auth>=1.1.0
django-allauth>=0.42.0
channels>=2.4.0
channels-redis>=3.0.1
django >= 3.0.8
djangorestframework>=3.11.0

```

## Backend additional docker images (docker-compose.yml)

```bash
# Postgres database
db:
    image: postgres:9.6-alpine
    environment:
      POSTGRES_DB: "db"
      POSTGRES_HOST_AUTH_METHOD: "trust"
    volumes:
      - ".:/app:rw"
# Redis server for socket connections
  redis:
    image: redis:5
    command: redis-server --appendonly yes
    ports:
      - 6379:6379
    volumes:
      - ./docker/data/redis_data:/data
```

## Support:

- Frontend: Telegram **@bestelde_chaos**
- Backend: Discord **mambaka** #0757

## Developers:

- Backend: [https://github.com/iCatOK](https://github.com/iCatOK)
- Fronend: [https://github.com/ars-kalinichenko](https://github.com/ars-kalinichenko)
