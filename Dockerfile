FROM ruby:2.5.8

# 必要なパッケージのインストール（基本的に必要になってくるものだと思うので削らないこと）
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends build-essential \
                       libpq-dev \
                       nodejs \
    && rm -rf /var/lib/apt/lists/*


# 作業ディレクトリの作成、設定
RUN mkdir /hotspotdb
##作業ディレクトリ名をAPP_ROOTに割り当てて、以下$APP_ROOTで参照
ENV APP_ROOT /hotspotdb
WORKDIR $APP_ROOT

# ホスト側（ローカル）のGemfileを追加する（ローカルのGemfileは【３】で作成）
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

# Gemfileのbundle install
RUN gem install bundler && bundle install
ADD . $APP_ROOT