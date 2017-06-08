# Git差分エクスポートバッチ

ある特定のリビジョンから別のリビジョンまでの差分を一階層上のディレクトリに日付名でサブディレクトリを作って書き出すバッチ

* 差分が多すぎるとWindowsのコマンド文字数制限が原因でエラーになる

* その場合は/archive/diff.txtに差分ファイル一覧を出力しているのでそれを利用してGit Bash画面でコマンドを叩く

引用  
http://qiita.com/youthkee/items/8579c7a963c24bd4e655  