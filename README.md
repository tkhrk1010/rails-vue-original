# 参考
https://qiita.com/Kyou13/items/be9cdc10c54d39cded15

# initial directory
    [project_name]
    ├── api 
    │   ├── Dockerfile
    │   ├── Gemfile
    │   └── Gemfile.lock
    ├── docker-compose.yaml
    └── front 
        └── Dockerfile

# how to use
### clone this

### create rails project
    $ docker-compose run web rails new . --force --database=postgresql --api

### comment in 'rack-cors' in Gemfile
  フロントとバックエンドでオリジンが異なるためCORSの設定が必要となる

### bundle install
    $ docker-compose run web bundle install

### comment in api/config/initializers/cors.rb, and change origins port to front 
    origins 'http://localhost:8080'

### update image
    $ docker-compose build

### create .env and add to .gitignore
    POSTGRES_DEFAULT_USERNAME='postgres'
    POSTGRES_DEFAULT_PASSWORD='postgres'

### edit api/config/database.yml
    password: <%= ENV.fetch("POSTGRES_DEFAULT_PASSWORD") %>  
    host: postgres (service name of postgres container)

### create db
    $ docker-compose run web rails db:create 

### create vue project
    $ docker-compose run front sh  
    $ vue create .  

    現在のディレクトリ(/app)に作成するかの確認  
    ? Generate project in current directory? (Y/n) Yes  

    プリセットを使用するかどうか  
    ? Please pick a preset: (Use arrow keys)   
    ❯ Manually select features # TypeScriptをインストールするためこちらを選択  

    プロジェクトにインストールするライブラリの選択  
    ? Check the features needed for your project:  
    ❯◉ TypeScript # TypeScriptをインストールする場合はこれを選択  

    Vueバージョンの選択  
    ? Choose a version of Vue.js that you want to start the project with (Use arrow keys)  
    ❯ 3.x  

    LintとFormatterの設定に何を使うか  
    ? Pick a linter / formatter config:  
    ❯ ESLint + Prettier  

    Lintの実行タイミング  
    ? Pick additional lint features: (Press <space> to select, <a> to toggle all, <i> to invert selection)  
    ❯◉ Lint on save # 保存時にLintを実行  

    Babel, ESLintなどの設定をどこに記述するか  
    ? Where do you prefer placing config for Babel, ESLint, etc.? (Use arrow keys)  
    ❯ In dedicated config files # 各設定ファイルにする  

    ? Save this as a preset for future projects? No

    パッケージマネージャーに何を使うか
    ? Pick the package manager to use when installing dependencies: (Use arrow keys)
    ❯ Use NPM

  exit from container with "CMD + D"

### change front/Dockerfile
  follow the direction in Dcokerfile

### run containers
    $ docker-compose up -d

### test
  rails
    http://localhost:3000/
  vue.js
    http://localhost:8080/