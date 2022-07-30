[Radd](https://github.com/linyclar/radd)の動作確認用のリポジトリです。

# 起動、接続
```bash
docker-compose up -d
docker-compose exec app bash
```

# コンテナ内での操作
```bash
bundle
```

以降、`bin/rails g radd:rule accounting/calc`などのコマンドでRaddによるファイルジェネレータの挙動を確認できます。
