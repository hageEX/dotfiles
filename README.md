## Install Guide


### [Vim-lsp](https://github.com/prabirshrestha/vim-lsp)
---

> Rust

[rustup Install Script](https://rustup.rs/)
```shell
rustup update
rustup install nightly
rustup component add rls rust-analysis rust-src
```

>[python](https://github.com/palantir/python-language-server)
```shell
pip install python-language-server
```

> JavaScript
```shell
npm install vue-language-server -g
```

> TypeScript
```shell
npm install -g typescript typescript-language-server
```
<br>

### (Git)ローカルファイルを最新のリモートファイルで強制的に上書き更新
---
>リモートの最新を取得

```git fetch origin master```

>ローカルファイルをリセットして上書き

```git reset --hard origin/master```


