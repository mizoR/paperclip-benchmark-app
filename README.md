# PaperclipBenchmark app

```shell-session
$ bundle exec rake db:migrate

$ bundle exec rake db:seed

$ bundle exec rake performance:test
Paperclip::Interpolations
/system/development/users/avatars/69/ce4f3d6db0389093af252534c90580a7dc3032f4.png?1431177309
/system/development/users/avatars/69/26c04430719655e50b05a6db57c865626bbd83a6.png?1431177309
/system/development/users/avatars/69/937294c6131df964ff766c884023ca11636a7dcd.png?1431177309

Paperclip::CustomInterpolator
/system/development/users/avatars/69/ce4f3d6db0389093af252534c90580a7dc3032f4.png?1431177309
/system/development/users/avatars/69/26c04430719655e50b05a6db57c865626bbd83a6.png?1431177309
/system/development/users/avatars/69/937294c6131df964ff766c884023ca11636a7dcd.png?1431177309

Calculating -------------------------------------
Paperclip::Interpolations
                         9.000  i/100ms
Paperclip::CustomInterpolator
                        16.000  i/100ms
-------------------------------------------------
Paperclip::Interpolations
                        100.019  (± 3.0%) i/s -    999.000
Paperclip::CustomInterpolator
                        162.002  (± 3.1%) i/s -      1.632k
```
